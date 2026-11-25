Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.69.250.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577555;
	b=13vmfaq0a1KeM16xSeLPzeBO7Ib8wx1qVAsNm4SY5chx/CNlKFRu3SD7QaLsRgCMxrKv
	 b0Ge0Zt2dy9eMnk0zNfC/sVa7YtPrXeECNaSuRnJ3QWFjozxr7dghuSIZTZ5vLT6dwjTG
	 2gAYzKrZjAWu+tK+r8WBqTGHB/Sv5tYZI6IHxftqifjK0/6/DpQLsUPLssSE1IuweLjOw
	 rutjtNk4SiWRcJCniZuqEefH0n3j6zOFBh/6YIhbqKBEz9x4MazQLcVn/CNJRoUIgKfAD
	 H5ZmnDJ9YKjdxc1sxRaIsnfj/dAyzRfgJWfnOiVAd6sSbiUJC3T2GZPYYOdZWsSglNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577555;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Transfer-Encoding:
	 X-Listid:X-Manager-Number:MIME-Version:List-Unsubscribe-Post:
	 List-Unsubscribe:X-Ip-Auth:From:To:Subject:Message-ID:Date:
	 Content-Type;
	bh=cxclr17vhjavZovgvZegm8hMrClnf505nqun+rbf9Zs=;
	b=CBOqPo0gAZKGcWCvmk94VPqadqidmifPtAn9fGR70XWAAv28CnVcfN/T70AQOXoSuOH/
	 mgz6rd2WCELUW7A0Z164jjzWDdh8HPAlECNHY4y2MR6hx9z+BRjFKXHhISA9YobargBc6
	 agi2YOgGtsEpDeUOXCxuAeKWyglNVjS3Kylmp8DUEw7PNKQRLV4y9rwq74N9LmAnqfFhl
	 QOjFB9XITEqiqgoHlbBHRQ/N9Jpv7HLVapS1MrGVqAOgP8AYx6zbl4qOftwFuV/LoEMbU
	 guQwKZJrgbAX8JPVV4ORR7U9EVWjgd3Rf7e0XBY9dJHX7lztpFTTc+7qRpN6IpdwlcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=chatgpt-event.work;
	spf=pass smtp.mailfrom=blh4.eipalloc-082e516cb5537dc01.mailmsg.net;
	dkim=pass header.d=trust.mailmsg.net header.i=@trust.mailmsg.net header.a=rsa-sha256 header.s=tps-dkim header.b=Arvsie6g;
	arc=none smtp.remote-ip=52.69.250.214
Received: from blh4.eipalloc-082e516cb5537dc01.mailmsg.net (blh4.eipalloc-082e516cb5537dc01.mailmsg.net [52.69.250.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800A606A31E
	for <linux-man@vger.kernel.org>; Wed, 25 Nov 2026 03:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D800A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chatgpt-event.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blh4.eipalloc-082e516cb5537dc01.mailmsg.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trust.mailmsg.net header.i=@trust.mailmsg.net header.a=rsa-sha256 header.s=tps-dkim header.b=Arvsie6g
Received: by blh4.eipalloc-082e516cb5537dc01.mailmsg.net (ESMTPstandard, from userid 0)
	id 4jZ4xS40Bhz29; Wed, 25 Nov 2026 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trust.mailmsg.net;
 h=Content-Type: Date: Message-ID: Subject: To: From: List-Unsubscribe:
 List-Unsubscribe-Post: MIME-Version: Content-Transfer-Encoding: from:
 sender: sender: reply-to: reply-to: subject: date: message-id: to: cc: cc:
 bcc: bcc: mime-version: content-type: content-transfer-encoding:
 content-id: content-id: content-description: content-description:
 resent-date: resent-date: resent-from: resent-from: resent-sender:
 resent-sender: resent-to: resent-to: resent-cc: resent-cc:
 resent-message-id: resent-message-id: in-reply-to: in-reply-to:
 references: references: list-id: list-id: list-help: list-help:
 list-unsubscribe: list-unsubscribe-post: list-subscribe: list-subscribe:
 list-post: list-post: list-owner: list-owner: list-archive: list-archive;
 q=dns/txt; s=tps-dkim; t=1795577548; x=1795606348;
 bh=cxclr17vhjavZovgvZegm8hMrClnf505nqun+rbf9Zs=;
 b=Arvsie6gf/jIv67aT1DhHzGJZESMVjYSGY+hNS9uTKi4yHsjPeDxn0R1ptJ+Kd3GETK/ZrBfz
 PpbhcR/qUM/9xDzm0DCwtp8zkdSvhCfr7G9R53W/jKh8J6zoxImsvzm4jeZRSACUqKa1CN/yvYc
 0bU50OzFpNvnvNdb2zft4gOMuqzhFpn49EsLzkUqSAzoR9WlWHQ/SDrnH8cQHA3D6Sn5wcKKXrK
 uiUgMQhglMjVLXnkIveStNIVWlIuIFRkRWrxD+vXoGp/M+Ob6JTYgrvtq3iJvbKZqJMsU1VXAGs
 sB79qxx9TyVAQ9/STCTClfuyiz3CEU30vxhFcsVX1lMA==
Content-Transfer-Encoding: base64
X-Listid: Publication-19f38d63a0b44e9cadbb6212223cc12a
X-Manager-Number: 102
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Ip-Auth:
 1d0u26fb9na0a7e7a7aa782dfbfce979d88x2a83b7fb0a55idc1f97cl-281b4df2278f
From: =?UTF-8?B?QUnjgqjjg7zjgrjjgqfjg7Pjg4jkuovli5nlsYA=?=
 <info@chatgpt-event.work>
To: linux-man@vger.kernel.org
Subject: =?UTF-8?B?5LqL5YuZ5L2c5qWt44KS44CBQUnjgavnva7jgY0=?=
 =?UTF-8?B?5o+b44GI44KL?=
Message-ID: <6AwxC4LGb3WmhRVba4OeaW-1795577486308@chatgpt-event.work>
Date: Wed, 25 Nov 2026 03:31:26 +0000
Content-Type: text/plain; charset=utf-8

44GK5LiW6Kmx44Gr44Gq44KK44G+44GZ44CCCgrnlJ/miJBBSeOCkualreWLmeOBp+S9v+OBhuS8
gealreOBr+Wil+OBiOOBpuOBjeOBvuOBl+OBn+OAggrjgZfjgYvjgZfjgIFBSeOBjOS4i+abuOOB
jeOCkuS9nOOBo+OBpuOCguOAgeeiuuiqjeODu+S/ruato+ODu+i7ouiomOOBqOOBhOOBo+OBnwrk
uovli5nkvZzmpa3jgZ3jga7jgoLjga7jga/jgIHjgYTjgb7jgoLkurrjga7miYvjgavmrovjgaPj
gZ/jgb7jgb7jgafjga/jgarjgYTjgafjgZfjgofjgYbjgYvjgIIKCuODu0V4Y2Vs44Gu44Kz44OU
44O844GM5aKX44GI44Gm44CB44Gp44KM44GM5pyA5paw44GL44KP44GL44KJ44Gq44GECuODu+WP
luW8leWFiOOBlOOBqOOBq+abuOW8j+OBjOmBleOBhkZBWOOCkuOAgeimi+OBquOBjOOCieaJi+aJ
k+OBoeOBl+OBpuOBhOOCiwrjg7vlrpvlkI3jgoLph5HpoY3jgoLlkIzjgZjjgarjga7jgavjgIHo
povnqY3mm7jjg7vnmbrms6jmm7jjg7voq4vmsYLmm7jjg7vpoJjlj47mm7jjgpLmr47lm57jgaTj
gY/jgornm7TjgZfjgabjgYTjgosKCuS7iuWbnuOBruOCu+ODn+ODiuODvOOBp+OBr+OAgeOBk+OB
rjPjgaTjga7kuovli5nkvZzmpa3jgpIK5a6f6Zqb44GrQUnjgbjnva7jgY3mj5vjgYjjgabjgb/j
gZ/mp5jlrZDjgpLjgIHnlLvpnaLjgafjgYropovjgZvjgZfjgb7jgZnjgIIKCuKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgQrj
gIDjgIDkuovli5nkvZzmpa3jgpLjgIFBSeOBq+e9ruOBjeaPm+OBiOOCiwrjgIDjgIDigJUg44GE
44G+44GuQUnjgafjgIHjganjgZPjgb7jgafnva7jgY3mj5vjgYjjgonjgozjgovjga7jgYvjgILl
rp/mvJTjgafjgYropovjgZvjgZnjgos2MOWIhuOAggoK44CA5pelIOaZgu+8mjIwMjblubQxMuac
iDPml6Uo5pyoKTE0OjAwLTE1OjAwCiDjgIDjgIDjgIDjgIAyMDI25bm0MTLmnIg45pelKOeBqykx
NDowMC0xNTowMAog44CA44CA44CA44CAMjAyNuW5tDEy5pyIMTfml6Uo5pyoKTE0OjAwLTE1OjAw
CuOAgOS8miDloLTvvJrjgqrjg7Pjg6njgqTjg7PplovlgqzvvIjjgYrnlLPjgZfovrzjgb/jga7m
lrnjgavoppbogbTnlKhVUkzjgpLjgYrpgIHjgorjgZfjgb7jgZnvvIkK44CA6LK7IOeUqO+8mueE
oeaWmQrjgIAK44CA4pa844GK55Sz6L6844G/44Gv44GT44Gh44KJCuOAgGh0dHBzOi8vY2hhdGdw
dC1ldmVudC53b3JrL2FpLWppbXUvCuKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgQoK44Gp44Gu5bel56iL44G+44GnQUnjgavn
va7jgY3mj5vjgYjjgonjgozjgabjgIHjganjgZPjgYzkurrjgavmrovjgaPjgZ/jga7jgYvjgIIK
44CM5YWo6YOoQUnjgavku7vjgZvjgovjgI3jgafjga/jgarjgY/jgIHkurrjgYznorroqo3jgZnj
gbnjgY3jgajjgZPjgo3jgoLlkKvjgoHjgaYK5a6f6Zqb44Gu5rWB44KM44KS44Gd44Gu44G+44G+
44GK6KaL44Gb44GX44G+44GZ44CCCgpFeGNlbOODu0ZBWOODu+abuOmhnuOBpeOBj+OCiuOBruaJ
i+S9nOalreOBjOWkmuOBhOS8muekvuOBrgrntYzllrbogIXjg7vlvbnlk6Hjga7mlrnjgIHkuovl
i5njg7vntYznkIbjg7vlj5fnmbrms6jjgZTmi4XlvZPjga7mlrnjgavnibnjgavjgYrjgZnjgZnj
goHjgafjgZnjgIIK44Gc44Gy44GT44Gu5qmf5Lya44Gr44GU5Y+C5Yqg44GP44Gg44GV44GE44CC
CgrvvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3v
vJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ3vvJ0K4pagIEFJ44Ko44O844K444Kn
44Oz44OI5LqL5YuZ5bGACuadseS6rOmDveS4reWkruWMuumKgOW6p+S4g+S4geebru+8ke+8k+eV
qu+8luWPtwpURUwgOjAxMjAtODg5LTg1OQpNYWlsOmluZm9AY2hhdGdwdC1ldmVudC53b3JrCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0t44CACuOAgOODoeODvOODq+ahiOWGheOBruWBnOatouOCkuOBlOW4
jOacm+OBruaWueOBrwrjgIDkuIvoqJjjgqLjg4njg6zjgrnjgojjgorjgYrmiYvntprjgY3jgpLj
gYrpoZjjgYTjgYTjgZ/jgZfjgb7jgZnjgIIK44CAaHR0cHM6Ly9jaGF0Z3B0LWV2ZW50Lndvcmsv
bWFpbC8K77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd
77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77yd77ydCg==
