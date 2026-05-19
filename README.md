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

## 저작권

수록된 모든 악보는 저작권이 만료된 공개 도메인(Public Domain) 작품입니다.
