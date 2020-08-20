
from flask import Flask, jsonify, render_template
from model import connect_to_db, Correction


app = Flask(__name__)


@app.route('/')
def homepage():
    """Show the homepage."""

    return render_template('index.html')


@app.route('/api/correction/<int:correction_id>')
def get_correction(correction_id):
    """Return a user from the database as JSON."""

    correction = Correction.query.get(correction_id)

    if correction:
        return jsonify({'status': 'success',
                        'correction_id': correction.correction_id,
                        'checklistid': correction.checklistid,
                        'questionnumber': correction.questionnumber,
                        'dateregistered': correction.dateregistered})
    else:
        return jsonify({'status': 'error',
                        'message': 'No correction found with that ID'})


if __name__ == '__main__':
    connect_to_db(app)
    app.run(host='0.0.0.0', debug=True)