
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Correction(db.Model):
    """Data model for a correction."""

    __tablename__ = 'corrections'

    correction_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    checklistid = db.Column(db.Integer, nullable=False)
    questionnumber = db.Column(db.Integer, nullable=False)
    role = db.Column(db.Boolean, nullable=False)
    answer = db.Column(db.String(2), nullable=False)
    dateregistered = db.Column(db.Date, nullable=False)
 
    def __repr__(self):
        """Provide helpful representation when printing."""

        return f'<Correction correction_id={self.correction_id} checklistid={self.checklistid}> questionnumber={self.questionnumber}'


def connect_to_db(app):
    """Connect the database to our Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres:///corrections'
    app.config['SQLALCHEMY_ECHO'] = False
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == '__main__':
    from server import app

    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.
    connect_to_db(app)
    print('Connected to db!')
