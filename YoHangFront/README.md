# node-sass command
## Usage

### MacOS
```
# STEP 1 : 프로젝트 디렉토리로 이동
$ cd saeedenyouth

# STEP 2 : node package manager 설치
$ npm install

# STEP 3 : node-sass 설치
$ npm install -g node-sass

# STEP 4 : 배포모드
$ node-sass scss/yohang-bundle.scss build/css/yohang-bundle.css

# STEP 5 : 개발모드
$ node-sass scss/yohang-bundle.scss build/css/yohang-bundle.css --watch
```

## vendors 스크립트 합치기
```
$ npm i concat
$ npm run concat
```
package.json script에 추가

## Local server
```
$ npm i
$ node local-server.js
```