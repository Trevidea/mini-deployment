from flask import Flask, request, jsonify
import subprocess, os

app = Flask(__name__)
DATA_DIR = '/data/thumbnails'
os.makedirs(DATA_DIR, exist_ok=True)

@app.route('/thumbnail', methods=['POST', 'GET'])
def thumbnail():
    # fetch parameters
    url       = (request.json or {}).get('url') or request.args.get('url')
    timestamp = (request.json or {}).get('timestamp', 5)
    filename  = (request.json or {}).get('filename', f"thumb_{int(timestamp)}.jpg")

    if not url:
        return jsonify({'error':'`url` is required'}), 400

    output_path = os.path.join(DATA_DIR, filename)
    cmd = [
        'ffmpeg',
        '-hide_banner', '-loglevel', 'info',
        '-analyzeduration', '1M', '-probesize', '32',
        '-i', url,
        '-ss', str(timestamp),
        '-frames:v', '1',
        '-vf', 'scale=227:110',
        '-update', '1',
        '-q:v', '2',
        output_path
    ]
    try:
        subprocess.run(cmd, check=True, stderr=subprocess.PIPE)
    except subprocess.CalledProcessError as e:
        return jsonify({
            'error': 'ffmpeg failed',
            'details': e.stderr.decode('utf-8')
        }), 500

    return jsonify({'file': filename}), 201