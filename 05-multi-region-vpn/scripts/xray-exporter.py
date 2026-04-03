#!/usr/bin/env python3
import subprocess
import json
import time
from http.server import HTTPServer, BaseHTTPRequestHandler

def get_xray_stats():
    try:
        result = subprocess.run(
            ['/usr/local/bin/xray', 'api', 'statsquery', '--server=127.0.0.1:10085'],
            capture_output=True, text=True, timeout=5
        )
        data = json.loads(result.stdout)
        return data.get('stat', [])
    except Exception as e:
        print(f"Error: {e}")
        return []

def generate_metrics():
    stats = get_xray_stats()
    lines = []
    lines.append('# HELP xray_traffic_bytes XRay traffic in bytes')
    lines.append('# TYPE xray_traffic_bytes counter')

    for stat in stats:
        name = stat['name']
        value = stat.get('value', 0)
        parts = name.split('>>>')
        if len(parts) >= 4:
            type_ = parts[0]
            tag = parts[1]
            direction = parts[3]
            lines.append(f'xray_traffic_bytes{{type="{type_}",tag="{tag}",direction="{direction}"}} {value}')

    return '\n'.join(lines) + '\n'

class MetricsHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/metrics':
            metrics = generate_metrics()
            self.send_response(200)
            self.send_header('Content-Type', 'text/plain')
            self.end_headers()
            self.wfile.write(metrics.encode())
        else:
            self.send_response(404)
            self.end_headers()

    def log_message(self, format, *args):
        pass

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 9101), MetricsHandler)
    print('XRay exporter running on :9101')
    server.serve_forever()
