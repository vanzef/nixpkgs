{ lib
, buildPythonPackage
, fetchFromGitHub
, networkx
, tensorflow
, numpy
, scipy
}:

buildPythonPackage rec {
  pname = "gcn";
  version = "git";

  src = fetchFromGitHub {
    owner  = "tkipf";
    repo   = pname;
    sha256 = "0mpkny693v54vrawklgl1xrfmd30acgccbn9q8ll1h8b7dfrw3zv";
    rev    = "92600c39797c2bfb61a508e52b88fb554df30177";
  };

  propagatedBuildInputs = [ networkx tensorflow numpy scipy ];

  checkPhase = '''';

  meta = with lib; {
    description = "Implementation of Graph Convolutional Networks in TensorFlow";
    homepage =  https://github.com/tkipf/gcn;
    license = licenses.mit;
    maintainers = with maintainers; [ vanzef ];
  };
}
