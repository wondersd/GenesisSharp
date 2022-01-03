FROM mono:6.12.0.122

COPY . /usr/src/app/source

# build universalAuth lib
WORKDIR /usr/src/app/source/UniversalAuth

RUN nuget restore -NonInteractive

RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/

# build TNL.NET 
WORKDIR /usr/src/app/source/TNL.NET

RUN nuget restore -NonInteractive

RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/

# build server
WORKDIR /usr/src/app/source

RUN nuget restore -NonInteractive

RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/

WORKDIR /usr/src/app/build