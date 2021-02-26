from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/", methods=["GET"])
def hello():
    return jsonify(message="Howdy!")

@app.route("/", methods=["POST"])
def echo():
    return jsonify(request.get_json(force=True))

@app.route("/health", methods=["GET"])
def health():
    return jsonify(health="Healthy")

if __name__ == "__main__":
    app.run()