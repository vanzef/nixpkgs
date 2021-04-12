{ lib, buildPythonPackage, fetchPypi, isPy3k
, flask, mock, greenlet, sqlalchemy
, pytest
}:

buildPythonPackage rec {
  pname = "Flask-SQLAlchemy";
  version = "2.5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "04jrx4sjrz1b20j38qk4qin975xwz30krzq59rfv3b3w7ss49nib";
  };

  propagatedBuildInputs = [ flask sqlalchemy ] ++ lib.optional isPy3k greenlet;
  checkInputs = [ mock pytest ];

  checkPhase = ''
    pytest
  '';

  meta = with lib; {
    description = "SQLAlchemy extension for Flask";
    homepage = "https://flask-sqlalchemy.palletsprojects.com/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ gerschtli ];
  };
}
