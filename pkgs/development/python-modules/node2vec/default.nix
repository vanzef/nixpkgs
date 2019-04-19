{ lib
, buildPythonPackage
, fetchPypi
, gensim
, joblib
, networkx
, numpy
, tqdm
}:

buildPythonPackage rec {
  pname = "node2vec";
  version = "0.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0vrphrlvd95ac28gh99h26rd2nbgm3pm2wnisdi1drlp524gsm5c";
  };

  propagatedBuildInputs = [ gensim joblib networkx tqdm numpy ];

  meta = with lib; {
    description = "Implementation of the node2vec algorithm";
    homepage =  https://github.com/eliorc/node2vec;
    license = licenses.mit;
    maintainers = with maintainers; [ vanzef ];
  };
}
