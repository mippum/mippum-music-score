# mippum-music-score

저작권이 만료된 클래식 악보를 MuseScore(`.mscx`) 형식으로 수집·보관하는 저장소입니다.

## 파일 형식

`.mscx`를 사용합니다. XML 기반이므로 git diff가 의미 있게 동작하고, MuseScore가 레이아웃을 직접 관리하기 때문에 MusicXML 변환 시 발생하는 디자인 손실이 없습니다.

## 디렉토리 구조

```
{악기}/
  {작곡가_성_이름}/
    {작품집_이름}/
      {파일명}.mscx
```

예시:
```
piano/
  ferdinand_beyer/
    op101_vorschule_im_klavierspiel/
      beyer_op101_no45.mscx
      beyer_op101_no46.mscx
```

### 명명 규칙

| 요소 | 규칙 | 예시 |
|------|------|------|
| 악기 | 소문자 영문 | `piano`, `violin`, `cello` |
| 작곡가 디렉토리 | `{이름}_{성}` 소문자, 공백은 `_` | `ferdinand_beyer`, `ludwig_van_beethoven` |
| 작품집 디렉토리 | `op{번호}_{제목}` 소문자, 공백은 `_` | `op101_vorschule_im_klavierspiel` |
| 파일명 | `{성}_{op번호}_{곡번호 또는 제목}` | `beyer_op101_no45`, `beethoven_op27no2_moonlight` |

## 수록 악보

### Piano

#### Ferdinand Beyer (1803–1863)

| 작품 | 파일 | 조성 | 박자 | 마디 |
|------|------|------|------|------|
| Op. 101 No. 45 — Exercise in Eighth-Notes | `piano/ferdinand_beyer/op101_vorschule_im_klavierspiel/beyer_op101_no45.mscx` | C장조 | 4/4 | 16 |
| Op. 101 No. 46 — Exercise in Eighth-Notes | `piano/ferdinand_beyer/op101_vorschule_im_klavierspiel/beyer_op101_no46.mscx` | C장조 | 4/4 | 17 |

## 연주 영상 녹화 (Windows 10/11)

MuseScore 4 CLI는 영상 내보내기를 지원하지 않습니다. 노트 하이라이트가 포함된 연주 영상은 아래 방법으로 수동 녹화합니다.

### 방법 1 — MuseScore 4 내장 영상 내보내기 (권장)

1. MuseScore 4에서 악보 파일(`.mscx`)을 엽니다.
2. 메뉴에서 **File → Export → Video (MP4)** 를 선택합니다.
3. 저장 위치와 파일명을 지정하고 내보냅니다.

내보낸 `.mp4` 파일은 저장소에 커밋할 수 있습니다.

### 방법 2 — Xbox Game Bar 화면 녹화 (Windows 10/11 기본 내장)

MuseScore 4의 내보내기 기능에 문제가 있거나 실시간 녹화가 필요한 경우:

1. MuseScore 4에서 악보 파일을 엽니다.
2. MuseScore 창을 클릭해서 포커스를 맞춥니다.
3. **Win + Alt + R** 을 눌러 화면 녹화를 시작합니다.
4. MuseScore에서 재생( **Space** )합니다.
5. 재생이 끝나면 **Win + Alt + R** 을 다시 눌러 녹화를 중지합니다.
6. 녹화된 파일은 `동영상\캡처` 폴더(또는 `Videos\Captures`)에 `.mp4`로 저장됩니다.

> **참고**: Xbox Game Bar가 비활성화된 경우 **설정 → 게임 → Xbox Game Bar**에서 켜거나, OBS Studio를 대안으로 사용할 수 있습니다.

## 저작권

수록된 모든 악보는 저작권이 만료된 공개 도메인(Public Domain) 작품입니다.
