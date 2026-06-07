# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 프로젝트 개요

저작권 만료 클래식 악보를 MuseScore 형식으로 수집·보관하는 저장소입니다. 소스 파일은 `.mscx`(XML 기반, git diff 친화적)를 원칙으로 하며, `.mscz`(바이너리 압축)도 병행 보관합니다.

## 빌드

PDF 변환은 MuseScore CLI(`mscore`)가 설치되어 있어야 합니다.

```bash
make pdf      # 모든 .mscx → build/ 아래 PDF로 변환
make clean    # build/ 디렉토리 삭제
```

MuseScore 설치:
- macOS: `brew install --cask musescore`
- Ubuntu: `sudo apt install musescore3`

## 디렉토리 구조 및 명명 규칙

```
{악기}/
  {작곡가_이름_성}/          # 소문자, 공백은 _
    {op번호_작품집제목}/      # 소문자, 공백은 _
      {성_op번호_곡번호}.mscx
```

| 요소 | 규칙 | 예시 |
|------|------|------|
| 악기 | 소문자 영문 | `piano`, `violin` |
| 작곡가 디렉토리 | `{이름}_{성}` 소문자 | `ferdinand_beyer`, `ludwig_van_beethoven` |
| 작품집 디렉토리 | `op{번호}_{제목}` 소문자 | `op101_vorschule_im_klavierspiel` |
| 파일명 | `{성}_{op번호}_{곡번호 또는 제목}` | `beyer_op101_no45`, `beethoven_op27no2_moonlight` |

## 파일 형식 정책

- **소스**: `.mscx` (XML, MuseScore 4.x) — git diff가 의미있게 동작하므로 이 형식이 정본
- **보관용**: `.mscz` (바이너리 압축)도 허용
- **내보내기 산출물(커밋 금지)**: `.pdf`, `.mp3`, `.wav`, `.flac`, `.mid`, `.xml`, `.mxl`
- **백업 파일(자동 제외)**: `*.mscx,`, `*.mscz,` (MuseScore가 생성하는 쉼표 붙은 백업)
- PNG 이미지(악보 미리보기용)와 `.mov`/`.m4a`(연주 영상·음원)는 커밋 가능

## 저작권

수록하는 모든 악보는 공개 도메인(Public Domain) 작품이어야 합니다.
