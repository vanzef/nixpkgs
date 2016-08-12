{ stdenv, fetchurl, xorg, libev, asciidoc, libxslt, pkgconfig }:

stdenv.mkDerivation rec {
  name = "unclutter-xfixes-${version}";
  version = "1.2";

  src = fetchurl {
    url = "https://github.com/Airblader/unclutter-xfixes/archive/v${version}.tar.gz";
    sha256 = "0jhx299lw169iakzg0zv7ss2xdbmwrxv97i7l9gak0bk9vxginmd";
  };

  buildInputs = [ xorg.libXfixes xorg.libX11 libev xorg.libXext xorg.libXi asciidoc ];
  nativeBuildInputs = [ libxslt pkgconfig ];

  NIX_CFLAGS_LINK = [ "-lX11" "-lXfixes" "-lXi" ];

  installFlags = [ "DESTDIR=$(out)" "PREFIX=/bin" "MANDIR=/share/man/man1" ];

  meta = with stdenv.lib; {
    description = "A rewrite of unclutter using the x11-xfixes extension";
    homepage = https://github.com/Airblader/unclutter-xfixes;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ vanzef ];
  };
}
