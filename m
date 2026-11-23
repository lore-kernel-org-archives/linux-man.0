Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795462886;
	b=igkOjJFEYu+wVVolAce79GduA+19174LxcNXEpF6ZGwHW5IS2WiHpuMDdv11E63GE3fy
	 2dYku/zxhtmQJHfOzZz+++wdZ1htArKDgtsDj617Nj0NhkVZFAJ6CsYjMXqWvjmQMaa3r
	 BwZUGOWagksenmAlJ5+w6yh7oiXuyeXL732kbctDgRN9/DjNunGbHxof3t1Zm4cOzQNSS
	 tK3zu7TmFnccJs7zXIyh3ezSeVoRlhn3hxUS5bcybszBhNxZkdzofmrdQTBy1ybP9AZ7r
	 4rc4vBW4qtE0mZyYTForZZpUcKjDQANtsFKckLcmCGXn1mfOF9LW+crkQTto2h9nItw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462886;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9exr+0nsvnsSi7jZB75Yz3Dzgx6ZWffPEyLkacwvAPo=;
	b=NNxz+sVY9rqYZca7vDTlwLcWbq7R7JYojNY6C/J37cYAqeTo4f4yFEAcPzUVh6gnTPEQ
	 Ll5WIAOKStVyfxH/eld1oKtTVH0dhdumHRo0XgYSfBkdsl0CbD6ZxlehjRbvPLGNKv1r2
	 htVynRKF6uQi5auP7RxZRSs6qHm6JofPp4e2zsMN0/0Dlg3Ztyay3UM3tob6eqPGkOB6W
	 Nr1Rwf1hYNcIvkbNhThSGI2jk5jMjSBzztDlGFc7dtwXa+qvsZWY+bLhu+7Ckvmk+9Mqo
	 bbES8RrQXFpev19iA6uBBIrDRyd84BCIHuAi9sErn89mZrNVVG7yx5P31+u6eoSVYTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CWKNNrBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011060.outbound.protection.outlook.com [52.103.14.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C4606A68D
	for <linux-man@vger.kernel.org>; Mon, 23 Nov 2026 19:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79C4606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CWKNNrBj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmYllTPsi7ujijLgpI29/nCPMhd65pzvkZnzHNL+w5v4ekLZAKqRMrD/oJJtAUV/JJz6lNDs8jIq0L8Gg+DiIJGD5c0gcBeaUkEi8MdIMAIQ8/aomibqyOykpWM3koz/UX/zoUZAo3DQRUQdaap451RVqXgm5iTamcbU/maILtQGZleiE/D64ZAKkccSR04MWrXjgA8RyseBuYOSXxTg7kEtkfXI043MelH3Y9Grdj+OVk6qCndMX7DDha/v6YsbUnxX6hUkGibO2ytyzyf3vMJFedSzv9mbkehtZQg7KP8nWgTmeQogWeZ+VOGtIz93cPkceqGmf+59Ukap3/FHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9exr+0nsvnsSi7jZB75Yz3Dzgx6ZWffPEyLkacwvAPo=;
 b=RnOH4hk7rsNojTAo2AL0o9jJBlv0ER4n0VsQUN0KMgtJ3DYGcDze/UHIFjcqNT/3z2XuaN1OyxXd9yfU7zUNreK35t67MfJeYmxjlKVcEZpBqitnZNmw8VWQaYI0UY4ykqm8QECEXuYGQmr99Ot+evt/CuslmxaSvX8z43EOqg/KVb8ywNecqvn1rns6hTH2q+SqH+OAXynjzdFbV8MXxRRpJuIAvmJpMcKBI4i1rbdGJ9pZTaKM6YZpC5rr1ughtwczXbruUCymJOWswmXEv9nPtx4lnTBGonT1A0uF8CVQaIimxLs0tAmkKOilESOpJg36B45BRtkrHhg75TT1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9exr+0nsvnsSi7jZB75Yz3Dzgx6ZWffPEyLkacwvAPo=;
 b=CWKNNrBjQR5JW0XHnfSHvSiJNYPMwXCH+i8/aYBHfe4TupmLMNIvqPAIeDR/kUbYbwTRxGEUFZyeMifWXVH4EtZ8eFfjRvuG91eSTgWUeUSBfN2QWVyuqHRN0LBG+ucRGcOJIA/c9OdIRWlyWs55H2gl2ba+U5LqrmcqkpbhPod01w/qeKWRZTCyZCQWn84PUYEcSaI+crSD4AhcAi7ADguzw/3azkoML1XTU4Duc5bcTBMX7ZsqNNRBk8X01GWsZIOTNFy9xgzJG5sz5HJMBEDRXmj3irLRLTXV5vnNJwjcHT7Wt5hJClKZsMUSa5xwvfsVbrsvdjicYAZkbBbsMg==
Received: from BN6PR2201MB1635.namprd22.prod.outlook.com
 (2603:10b6:405:2b::36) by SA1PR22MB3928.namprd22.prod.outlook.com
 (2603:10b6:806:339::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 19:41:23 +0000
Received: from BN6PR2201MB1635.namprd22.prod.outlook.com
 ([fe80::756f:1488:1591:f15b]) by BN6PR2201MB1635.namprd22.prod.outlook.com
 ([fe80::756f:1488:1591:f15b%7]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 19:41:23 +0000
From: Graham Manson <manson.graham@outlook.com>
To: "alx@kernel.org" <alx@kernel.org>
CC: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: broken link in man7 man pages footer
Thread-Topic: broken link in man7 man pages footer
Thread-Index: AQHde4Ke/zFJkKAJFU+C89wfTMfB/Q==
Date: Mon, 23 Nov 2026 19:41:22 +0000
Message-ID: <DD6CA25F-158C-47ED-B99A-9EB6ED7BA515@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR2201MB1635:EE_|SA1PR22MB3928:EE_
x-ms-office365-filtering-correlation-id: ac1e8dee-85cf-4bf1-2439-08df4999c138
x-ms-exchange-slblob-mailprops:
 igNrEvV8uhEjvtWg4HuO4afqtzhSzTL4COpF42eFG2dtby6sBdL4u8qqRLFHil8KtLGLwvNs08KtEeyMZkDQLyRc4bULmNhr4qHqCseU3BO4VuT9//Whic1E21dIE6OcIpvoBqyU0qaG8GiusIfCi75nUsKxLYMfxA3BzBvgQE67BP95U2nb7Zo2Ms4BKied5vIU+CHZ68e8aUSvcwDWsauQZIYaHklD6nv3RYM21Q6G201v457zhl+bdv4gfocgFW5nbcqRyq+Uq4dg1cD6aiaUu9TeiVe7/TfS7IZobRj0ntHkeL3aEgIbCN/5RtDAm28gddL9uG+ytEC/Eb1XNyPVCchVv1aROgotJBxQj3RMdMPcrCRmo59AR1xaDI2XA6T3gxPYKuhYYQH9qGeeXTpsUNYvT0DGmLVOAEFtc5U+wWFpzlbltWG5Wszg22rWY60oXQS97wK/9bbcaX4bZNCQ+wm6FHqL94FxYy/HbaIeQyoJTZ5f4uricDyJPqkBCmF1wrAtdPXKQEE70MdgoAj3yBb8nEUVQiz1uTnowSfWteCqO3kNfPRPiW2ET5VO4yhxfomlDvlEDcYyYPCRAgYbXFzoCcKBmKLYZwKKO4YGTFcSMDBu1gjpgpXNLjJqOp0mCTZUgSLHBJiQAgeE9R8zfWx//zHoRRZMEMdDsY3UnDvNKKNeYXJ1orAFQg+evGVdj5TIu38=
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|25010399006|39105399006|20031999006|4140399003|8062599012|8060799015|19110799012|15080799012|31061999003|10035399007|40105399003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
	=?utf-8?B?QnJSbGpZSHVETEZtdk4vNzRSS0gweDR0L29hblZKZHpxeDFEaUs5dXcxNFk1?=
 =?utf-8?B?c3BCeTRXVXI2ZkdXUjhHWXpCekw5Z3QwamlxOVZqQmx6cUdkRDNEWlNCelJR?=
 =?utf-8?B?QUEveDR0cWJWaTJkR2p1cmlRUmd2N3VGUFZpZFl4ajQ3Q0JOWFV4TVM3V0g0?=
 =?utf-8?B?Snh1TlN5WlRiNUZybXlTcG5PejBRaEttdkV6a240R1k1WkdPR21pU1lhamZs?=
 =?utf-8?B?eHhUTWN4dHVSaUtKS1JvNkxSeUdYbFFMK0laRTNQM2lhVGN6dWxQRGpTWXhM?=
 =?utf-8?B?aTN3eXZRd28rbFlQaVVqRlExbExNN2hCR1dZWG9FcDVpLzI1NE9sK1F5NHlk?=
 =?utf-8?B?TWZVMUV5Zy9VdEZieldmb3pnalJzU1FPUWxwcjhLMlZnS2dsTE1sWlZFWnY5?=
 =?utf-8?B?MDY5WkdwczZ3anNaMC9DTCtFUU1uN0U4OXRaWm0rS1FjTFBSYXhad1cyNG84?=
 =?utf-8?B?elgzbzY2c3dJUHZoVmEzWit0dkZwQStHczNIczVtSmNLTGVRSFJrNExNdHVI?=
 =?utf-8?B?QTI0K2M3VDJNakZBSEJ6YnBvNkFpQkYxeGlGeklWYkdESk1xVHlPQVNHYjBB?=
 =?utf-8?B?RkZ0WE9VRjdpOEVucDNxaXRGdHFic05Xb3p0RUFpZlF6d2xuQ05YQi9kQWpl?=
 =?utf-8?B?cVhnNHd1U2ZuVG12UWZRZU9SODJvaXdNaXVzMkZFRXV5TFYwSkpxU0kwaTl1?=
 =?utf-8?B?aTZNN2VDeW01VThsTVBsYnpvVmxjelE2NStjak9QR21OMWE0T2pveTlqR2Y4?=
 =?utf-8?B?NzkrNFRvd2xPQm1nU1B0SDFYNDlFaTBGeUNJU3pLdGh1b0s3d0hIcVRZRTc2?=
 =?utf-8?B?MWNpTGJ4bTRlemxydEx6WUhsS1pFeWZvM2dDNUV1VHFQd0pvc05EdGVKbkpX?=
 =?utf-8?B?WXNoRUVGRnZkMG15amJPd1pwWEFIcFVweDNpMGdUWFZEN3hlQjZ6VXJTbm4r?=
 =?utf-8?B?bDlkckJkSmdVSytHNmplSDVRWVlQdjdDalNTakxDYi9PQ1I3SWJLOFJseTRw?=
 =?utf-8?B?Szl5aVV6R0VubkpQUktlYVlkUEYwa3Izc3ZibVlXL2dzM0tHMEZWYWs3eC9r?=
 =?utf-8?B?MHZTYTYvWjVTdC9BY1NKQmp6SlBZWTZUQlh3dTBPcjNrSU5mZXZsZjV3VmIy?=
 =?utf-8?B?SUhJbmxSdlBEenUzWk9RVVVoaEthQlFpOXh4cnl5RkpZNGMrbG15d3BTbFJX?=
 =?utf-8?B?TFJ4akptSmE1amJMekpzUGxsdUhCTE81YlRYRUNBZFlVQU9RZlNnbnFxbjNG?=
 =?utf-8?B?VVNRODZFcVVjSm8vVFRHVE5yR3grbCtKdmlReFN5VGZzdFVxUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWdRSklXbmJ3cUR2d25tVWgvc09EM2dnMnArK0RLK2ljNlM4MGJWVkRySnNm?=
 =?utf-8?B?M0xHay96aXZvcEFBUjRNV1VhZnFXVHVsSTQ5UHJSYWx6dGtQNzdmbit1Y3dj?=
 =?utf-8?B?cHdaSFpjaFM3U1duV0xsNW52ZWlXT0FrUUVXTXFpZUJ6SFhVeE1qV2FXY2Zw?=
 =?utf-8?B?SVVGSGl0N2IvaUdjWDFoSEtuTW5JSDBIcGo0VDBIb3FLNTArNzhiY29aQ0ZH?=
 =?utf-8?B?TFRaZmVKQmlKU3hWUXM3VjFCQkkzQks5WkxwMmM4dThaajVmdFo3NWx3V1pJ?=
 =?utf-8?B?N0dKNndKams1UGV1VzdSUk42aVJMUE4yUFowK0N1VHpvK2w3R291Z2RWM2Ix?=
 =?utf-8?B?WDh1SG1sS1VwWjk3bStiU1hIVzcydG5CWGl1YjVPMG5kbCtYeXkyUEJkcENO?=
 =?utf-8?B?K0dDUFlOR3RFbktieTlCcituUklnODN4UElPbnlSOXExNE01YUsyZWtyZmZq?=
 =?utf-8?B?T2FiTy96THo3WmsxSXNUVkVraExEL1VaL3hyOEhmUGdYclRjaFlVeDMwTjZY?=
 =?utf-8?B?SG5sOFB5M3BKMTVHMDlUVzhNeHp5OWxPeUs1WUhqa1d2Qkt1Vk9nbE9WVFh2?=
 =?utf-8?B?QWFsQ2RQb08zSVArWThMWnVvKzltdThvdjBaTGZtaGJoMGk5YXNYd3o5bFc5?=
 =?utf-8?B?YUdEVmd2eFFjR0Zhd1FiL3RQNXNRTTV1V3BNMXNoT1U5RU5QbExTRE9TYjdm?=
 =?utf-8?B?ZWx1TXlrSkkvWVVoK3J5NWZuOHRReWdOSTFMMHF1UWZzR3Q0eTlrTlBPaE5m?=
 =?utf-8?B?MEhxY2tkbWxtMloyQWhyZWNGQUgyTVpMR3B6SzZpZjhMbzIvZkQvL0w1K1BS?=
 =?utf-8?B?TWN4WUswTDdYdVZrZTlKaXlqazBzSU5USDBTUndCaFRNeUM5TWRsRk4zYkUx?=
 =?utf-8?B?YnZKZEh2RkczWmc4anU4ZHg3L1VhekJHMUdTK1hra2lIcTJNckY1ajZxL3lr?=
 =?utf-8?B?SWRZVGVFTE5sR1ZoY1JFRElqV1V4SGFHdkpYYW9Ba0lMU1doOEdxV3FqUnRh?=
 =?utf-8?B?K2Y3QUJCUWR2Z1FZU0Z0b29OQlp4MGhXRUdCUHVqKyt3N29RK0ZTSTloeUE3?=
 =?utf-8?B?NVZRWWRJNGdWYnZJZkgvNVBpbk1XeEFTVGZ3azc2T25yeklKMmZORDZQenlC?=
 =?utf-8?B?bC9BSnFKcWtXMjU5Z2h1YWFiVklmWFhhMTNCT01rdVFLVTNrR1kxc0dCa3hy?=
 =?utf-8?B?RFE0WVFsRXZYaHo0ODFuWElwTU9VaTAvR2VBNUt6R2xhd3NtQW41U05PbDlr?=
 =?utf-8?B?Sjg0L3lkeFExSy95Qk5LTWlTMkJENjZ5cDFuMmpsV2tOUkdFMlNqQ0VtTzNm?=
 =?utf-8?B?TW1aUU9LWFZ0bDUyeXBYMjM5OXZhQUw1MUpNZDU3alh1b2dGWUFoRVRPZS9p?=
 =?utf-8?B?NzF4V20rSFRBMjF5NGJ3aGVjWit3WWtXU0tsdllHRXRyMEdBZGhOZzBUclVj?=
 =?utf-8?B?cFRSWkdUZzY2MGNDdlBXOVZTQVVpaENrVmtKNWo0QXhrdUYvUnFEMkZoZ3hr?=
 =?utf-8?B?aEZ6YUpKUHQ5NHozdWlTSCtMaFh4d21NYndPZ3BzRUx4YVIyWVhzdHNDdy81?=
 =?utf-8?B?YVRZdmpLMU1KRFozbkV2dFduVzQ1aUVTOTNPT3ZYdElTOEQ0Z1RVRDYzRnBy?=
 =?utf-8?B?Q1NQN0p1em10QUIxdlJvc01rVWNHUTlTeUYxdkRnenpiSFBoelR5SWVnM01n?=
 =?utf-8?B?WUZ3bjhPNDVyMHVReGt6Um1EUHZTLy9HaXlBNGNyTHVNV2t5amtLVmRBZzZY?=
 =?utf-8?B?bDJHbW5JS3NkT01aaENBU1FPSWFvZ2JncmozWmVQVGpKQVZ6dDJTcTVOS1hp?=
 =?utf-8?B?S3I2akpHMVk3ZVd4RmdUT3N6bVUzWTJSUEtSZlpjUW9LdjJjUHhaNlNYakFz?=
 =?utf-8?B?cjJzejVxaExIVFozT0gyOTRzZDQ3N2orL25RK0VYemtFU2t6VUFzRzZJZXB1?=
 =?utf-8?B?eWNYemhJSjh2TGh1UDF5L3dKdk9nYnRIMG1KREt1ZFYvZFpwdXlBemlLK3h1?=
 =?utf-8?B?UTNKYk8yaXlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01315858E6D2E84A8F7FC65B78973D42@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR2201MB1635.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1e8dee-85cf-4bf1-2439-08df4999c138
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 19:41:23.0047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB3928

SGksDQoNClRoZSBmb290ZXIgZm9yIG1hbiBwYWdlcyBvbiBtYW43Lm9yZyBoYXMgdGhlIGxpbmUg
4oCcSG9zdGluZyBieSBqYW1iaXQgR21iSC7igJ0gVGhhdCBsaW5rcyB0byB3d3cuamFtYml0LmNv
bS9pbmRleF9lbi5odG1sLCB3aGljaCBkb2VzbuKAmXQgZXhpc3QgYW55bW9yZS4gSSBiZWxpZXZl
IGl0IHNob3VsZCBwb2ludCB0byB3d3cuamFtYml0LmNvbS9lbi4NCg0KVGhhbmtzLA0KR3JhaGFt
