from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "Welcome to Healthletic DevOps Assessment"
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    }), 200

@app.route("/users")
def users():
    return jsonify({
        "users": [
            {"id": 1, "name": "John"},
            {"id": 2, "name": "Alice"}
        ]
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
