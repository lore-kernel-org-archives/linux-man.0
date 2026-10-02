Received: from GV3P280CU013.outbound.protection.outlook.com (mail-swedencentralazolkn19010041.outbound.protection.outlook.com [52.103.35.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08173E2746
	for <linux-man@vger.kernel.org>; Fri,  2 Oct 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967363; cv=fail; b=pcOHHaZzuFemtM2qJTox5ovhxD/DizZR1mxJghDuD1ez/RXUcZriovHU1ImjGtAoz/Td3ylTQbEtKr3WzWRe6brwH5+yghexRNPIMrBFZQxxDTjckjoeOI03oTkTjmGUtL15ERvPi96QACFwCy0/gaWYfdMm88Yclr6sW5mLbCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967363; c=relaxed/simple;
	bh=l61rJeQrBCDZFXMvft4LZ0gwU5Q6G0Kn8dPLTHpmJhc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PzBZMMv/KcoZul830AlkLb5/V0ZlmmZuonTXDptme6Y696bAl/B6v77r1xGNjNeL1XrF3HWyjVNdBsk8sox9u4UksjEp7ZZKUyPc7SizIDrMIkS6f2kLuSNGyKatu5UWZFpfpl14W8pMw3TrXu8u5tiWCqZGpvvaHoa6pUvh/24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=DbGnT7HU; arc=fail smtp.client-ip=52.103.35.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="DbGnT7HU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhDqWmIiQNLTOPmtIg6h0xYJwTdiyCUA2CskqJlSLQYgFMs7IVdV91eW0NA8yglh72S3+W/KhgXTHVFA1Aj7d6e/9Ix5zw4EUmqsr+O87muu2IYRHSAbKEy2URs9M68FYJQqqAmtU7OjQkgvHSI6shMKcgUSvY9r7Q1fiubYIX8VbObNjbAw8j2JyMJk7hvedi2G2k9p0mcPX7Ef1R2Z9Jnbpwx346nvjMq7SjbCVnvC0NkXK+vbwjUbI3+fxo3EuzI9NnSB3/Fv4WsbAMEM6x/y+yviO0dbdp96f+Ufye4IOGMkuyz+2+dE/RQ323XAH5r/sHWAksP+snGnS5mN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l61rJeQrBCDZFXMvft4LZ0gwU5Q6G0Kn8dPLTHpmJhc=;
 b=vaXA4APF+AR+Vrt7JXOLUFHki6jlum0Gxw0v4+0GP14uyFkscuAXWVE1rju5zv0tSBUMS51WeoeD9/waZ2dMRHzSB/RO0K7E6w5+OALEBXWzLPsT9DYS7Sqtz3yn1N73myrsgXcbO1Hle5CUHonY9hOhgmss7IQoOlxpG1pakHfstWlsHHe3szIQRVgCTe/prrpmHmBxHWnrIpqOa1BIHefhBgwWnaJdkgb0J4J6EFXlX+TeuEFn9zjH7S4H8V8k6+PzGDFMasj8GMxftNv41P6bo8MpBdtupu1GcfyNL37yFtYkf4k/KQT8ldRRHD9mHcnRY53Oe8aN3V+2s0B8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l61rJeQrBCDZFXMvft4LZ0gwU5Q6G0Kn8dPLTHpmJhc=;
 b=DbGnT7HU06HXKzfm/9lopBbE49ci7T27sjlbvvAeOV2l3KM3Uh8U+xVs3sYUHkAUS9+eBk0wzDXofb2IUOMLt9gfOBl7CRA5W0PxLNCtLPWiBFEUy4huXAE7Q1B44Yh0XTnH9OUoNDgsJBrgMeycp6sZRpOFqMmbML37GOVgZOO3jHx27iB/x1uFw4gaFyYcnmXVManU+clwSlF+MT4jA7fDsfK0FOHePt8vHMs+pJkC8mihPJqIJpwKnMiVSlOY1Wx/3x0+1+AAR3ALUdNCKaAiMOLVpe3B3i91If+GERHUecWdm8O3VXtZy9hs6V3JTO+23jThA4m8Ov2EwlYATA==
Received: from GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:194::16)
 by MM0P280MB0865.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.19; Fri, 2 Oct 2026 18:55:58 +0000
Received: from GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM
 ([fe80::e6c3:4864:537e:cf00]) by GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM
 ([fe80::e6c3:4864:537e:cf00%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 18:55:58 +0000
From: Roger Olsson <master_pumpkin_@hotmail.com>
To: Alejandro Colomar <alx@kernel.org>
CC: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Copy-paste error in sysexits.h.3head
Thread-Topic: Copy-paste error in sysexits.h.3head
Thread-Index: AQHdUp2eeOBJknNYhkCMbvt/t5Y8Xg==
Date: Fri, 2 Oct 2026 18:55:58 +0000
Message-ID:
 <GVZP280MB1343F3F7699675A1220DF744A7892@GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVZP280MB1343:EE_|MM0P280MB0865:EE_
x-ms-office365-filtering-correlation-id: 7ef59d04-e805-41d6-2cfe-08df20b6cbae
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|20031999006|15080799012|24021099003|39105399006|6140399003|4140399003|31061999003|19110799012|8060799015|8062599012|440099028|3412199025|19061999003|102099032|40105399003|2607281247196008|3430499035;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oU/nTj8pTL0w3/UhLBRcTb+QT34LLqkxRW2WHMmIplhuvwW9hHYcCLZhqj?=
 =?iso-8859-1?Q?zQ3CvXj9ePfpNy6mIK3SY/3w0PIktPnHsbuTBjthdryIC5MfvQn+Gkw164?=
 =?iso-8859-1?Q?fJ+svGx/PCWB4VCHYA4OuHJMpvoW8a8UpoKd9NbxPRt4I0dhlSXRhdZEfp?=
 =?iso-8859-1?Q?nwh0zsXU01II/elbgLsdvpbpzyEaabPxEy/g/RaYJdYAnfQaobA2RUGYtD?=
 =?iso-8859-1?Q?/6KetBGqX3Np/dzstQTAoLksonS0xCEArMc2sq85gF7fRF2D3wk+WDGvAP?=
 =?iso-8859-1?Q?tKecjnnsaZu3mEkT3dpuI0NuwZ18lAdk8/pO1qu3pRJ3uvzD+xEAncB0Py?=
 =?iso-8859-1?Q?yRJbGSsr31BgTKKRr8Z3oIf2AXrj6kRWXGbvD30lWIlv6/FvR3nOetBy5o?=
 =?iso-8859-1?Q?WveOzZcHGi30am/pey3OzUncf2A+BopamlYMzF94YKr4zkqvolqcHZ4ncx?=
 =?iso-8859-1?Q?4z6fPa8iXTxp6C27Tmcb4/b79HnBb0nOfh1l6JJ66HDK8moKDEFLFxHqa6?=
 =?iso-8859-1?Q?P7XXDr93XkQZF5DF4+O+OAENlrCeanKhYCXiqYHmVG/NT64obec8IEvZXN?=
 =?iso-8859-1?Q?hcTBj4iXG14luBjrnP4mcMENfTANtrpDcNZR8SFtKcgFFtwMXdQTXWz1gm?=
 =?iso-8859-1?Q?JsKTkxNCKNDVk4fw/o2IP1hiuntkdZYbHYVUB+JhwXUysFrhhfANZzXdjb?=
 =?iso-8859-1?Q?WHV0/Gmar3v7QeW/aT1OzSc6Koz9UE4B2VSK2wIkDWTDj6UcBCwDB5NKsB?=
 =?iso-8859-1?Q?zV/eD6dXSz4eTSGCKHVLw8eGUhFwpajdfcG/AwU+VnQ6vUFUmnq5x1Ny5h?=
 =?iso-8859-1?Q?NkJAf+InjCX1iWg5J1wq7362bEXmw4YuUoelAo5X1dEWjKx3eojckMPVvC?=
 =?iso-8859-1?Q?/eeaNYahLKVyyTqfdlwYYAjhonReRpMsWmA/9XFkU56FZANyFBcrF/sgzz?=
 =?iso-8859-1?Q?wTdq9uAhAOW6Wm/7qUydpRk+GGZphWO57hZ13q3HeFGKq7P0oZWqjkY5Ib?=
 =?iso-8859-1?Q?EOZWHIGq+GEsmTUYbHl3lGl6hBhnhsv+1feRVEbg3kwUg+jO1MZpbf6ldO?=
 =?iso-8859-1?Q?+aPetrKJK2mj3Oap6je9ldk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NzRhoQdVrSISgRIiSFi5lf0TbcsDyOXmbCwflTPUfKtH+EbXmMS3dVmvwt?=
 =?iso-8859-1?Q?BlA4V6fnkVls2jSqZV9RBdrRTXRvldbf72DnPV8zR9ushfn7XhqpTezOl/?=
 =?iso-8859-1?Q?ZSxX2OGEysNbPHQuKKEHLGpHE9tFhVC07KmE7HItlJ2R83EXkpCxSkBvh/?=
 =?iso-8859-1?Q?UVrfRN9wQNUk2H9EoCZyIo8qQOrxrpk9gnBbv4ZQp3fVIfjtJr8cmTRVb7?=
 =?iso-8859-1?Q?yugfYeDs17DnFMzdskeWXrzpPuybNYHOpPXeUM8yziv3N2zI3j4JDyHHMI?=
 =?iso-8859-1?Q?Coc7j+L0QSSdg54jv3vKFNQXPSDxp2Ort32iVOAfV+6VIX8jhjdL1n8H3b?=
 =?iso-8859-1?Q?S5BbGtBvwaLUWgsTv8hBEyEMkYjhN3Ymjltq7u852Behrmzv1UxK8dKMBM?=
 =?iso-8859-1?Q?4Do0g6SR8zNcJ/2RAN01l8ctZHKLAnywG2C4Q44tBvc+xuyS1Ad+rq2meI?=
 =?iso-8859-1?Q?S+Iu7z05lKG0qO/H8uYbXLEMvGLpbhLStEHjXXJVySecN5X8AFNNOTRiCh?=
 =?iso-8859-1?Q?k37G/sAyU3LrkquanZUttVZITPVO+rMmlIV8awSUyFfc/tHXhDcL5yX1GC?=
 =?iso-8859-1?Q?MTo517V35fywaifUFh/xlMSJzPs/IHtV4y4TGlSdmEuYlNU1m54YBnblrL?=
 =?iso-8859-1?Q?/5e852sUfxfJ3ay4OttjIf5aeQhRzWuJqqYcWpMznZiux/u2v1TvkIdTxE?=
 =?iso-8859-1?Q?hNVschrnRwdmtBMJKw92pipCYVxnaT+9KNLfzPJLWTb/ePwLnW/XjhtINe?=
 =?iso-8859-1?Q?M9anIwGuEatoYNSiEd/sZPmvY5Y10OxusIODoldjIxpt07VwYaF3/wHK/j?=
 =?iso-8859-1?Q?PB9W/V6rqlNLvH4pLAZ+sHWmlmA9AD+LVZKXytps7dSAT4+jZl9yIyIZo2?=
 =?iso-8859-1?Q?gvN8ehFtkm5nX2GeBFIA7LhhIoe2bOsmjKLzK3lna+2XTBW/sy4ndM335H?=
 =?iso-8859-1?Q?j4NZB6FqUJzFByQEeTyu1AFi8xdop8Lp3Upw7xj/q8rZMqxME9ohsrhB0q?=
 =?iso-8859-1?Q?1KIdXB5uRoCfBOa4lBqAjD8VecGDw1evSEhROczWoUJJ1aKQcm6GTuIi+x?=
 =?iso-8859-1?Q?s9QJ8L6YfLwb8TkHx4Afbc2KuLtJzb/v2q2n50Ifc7RIF+p+twQrpe35vm?=
 =?iso-8859-1?Q?tFAPoydIZaqdpdVz9fK6vvRo+O6vbq10mKQWvfu3xPN+LpkYiDMknGygFw?=
 =?iso-8859-1?Q?K7WzqgHBIelHegMpOo7q1egaxFjb6jKBF6l6rv/UPfqd8T0OHWYVJnOvId?=
 =?iso-8859-1?Q?SRlvgEN/XmH+VM9eghcT0FpJgN2cuYtOMut6CbQhLvZBbz6H7wozvKEL2Z?=
 =?iso-8859-1?Q?ctCUXqDkL2NG69TQjqdLU0XWd1wLN4wzViN7NJSwB7GnPMUt7/wTIL0HW3?=
 =?iso-8859-1?Q?mwrqxkiqLZXAArrnxwK6E4sIXhENteUyU9ynMnnXAdrRs1yZdU7UKBuUKI?=
 =?iso-8859-1?Q?1XUcUzZke/XlhA92?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-10872.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef59d04-e805-41d6-2cfe-08df20b6cbae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 18:55:58.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MM0P280MB0865

Hi,=0A=
=0A=
On line 170 of /man/man3head/sysexits.h.3head, the name of the exit code=0A=
macro should probably be EX_NOPERM instead of EX_OSFILE, which is listed=0A=
twice.=0A=
=0A=
EX_NOPERM (77) is listed correctly in the synopsis section.=0A=
=0A=
Regards,=0A=
Roger=
