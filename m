Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605322;
	b=epiLQSEIFLY0TfryV2LEnfelT5A+S+M+wvybpuTE+OYLWS4LDYgQ8z/iPVw/6/L08MSn
	 RvUeVihTUgmCJqOQHIDqy4rh8FC/OMU7yZbPWkwT9Y86u/dHO65BZtdV2rz84mXH6Gm+w
	 SpD9ckMUXaLWEPP2yTf2cwjQl7e4N1LpTJsmteByvoVqQbgTUSJldTj3r6joJl7aZOQQP
	 TQ+FJ2kRKKFQ+SYhgy9inLcuQr4woPAcUbU5Hhthb++wk/hrsDX1DxFDtdxnPlRS+cWT+
	 vVfTz2cJFeKVLF3WQvm/JLegYlSQiwKaqObYzE5ff/NJOTOurNR/DU1S8jjJfOyuFBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=7ImJojB8mFALyxSggJrgCBcWhdVRXQ+JYdH96Rugn+k=;
	b=OsJAMB/dOyWvZUCF+6G3uib8zQQnASthYsaEHWpseF78tD2IdQJcvklIpPsJK+jyrmVA
	 sDSaWiJDj5bZdHH3Um7boZrkjyD67ttcIJTJsIJiPFjCeb1Xza2V7NjaAUpdEXJ//BNd1
	 Aoi2UvgX17hVosvtCoYlv5VOcks2Tp87vgzS2K/soQb0iCv8rFS8FUXjg68JEsfPk9fC7
	 3YoLtv1YEdqd6xMf1PMeQ505SiluTQbIBZY7DlWRiET36gS9hJ7uIvjIZMRCt7Hy2uMj/
	 SsyVxvgUP7IH4GByPFMjfaOx9JLc1Rdyp+WnWAgQTXjulErmcgSZhDBAT/W0lWMz12w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTvlVUbi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94C606A330
	for <linux-man@vger.kernel.org>; Fri, 13 Nov 2026 21:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C94C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTvlVUbi
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48ed0b68895so1654968fac.1
        for <linux-man@vger.kernel.org>; Fri, 13 Nov 2026 13:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605321; cv=none;
        d=google.com; s=arc-20260327;
        b=pZWm4ZoUh0Lc3KHdpqwEGV6e82dAKJomBZ1yRjEIvt8Z1VVzgbMhi+IHmXkXFENJJT
         hUI+3BSNI/fB7JLle5bqVj1GcBQ0//FR2yMOHOhxAulEZ/ylWDgNuPPKveeXqt2V/Zsf
         zjNfZBj6i+Jxl9vvTyroFYUuMHbOtCFK2+r7SSpP3b+Cv5iOzymZdUyo/jd3gF9UZGSF
         Sf035yyA/1vPtYBc0E/WUAgUzRbI0L7wm7skYiZlCfs6RZrfrEP8YKxjbZn1JaBq/bd1
         dRj30W6I3ShcpxCjIg7MCfpmAoB3A4J58pSVvU3UqIB3/tYO2CxPH/zl7fZBq9rnpp0I
         VxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7ImJojB8mFALyxSggJrgCBcWhdVRXQ+JYdH96Rugn+k=;
        fh=OclAtLKJTQTIvPXBcbgjquIcuF1L0TED2I15vb2Dds8=;
        b=XT1Nne5WcMdfbNR0CcbphG+06Ex42JDv1f11gXNO1LfcMyZn9SGMKO84jgzLg4ksey
         CQ9bT1O+fxGrAHWZMPDpPRD0eN1eZXh7GUTRGmCNLBOmT8j/WGVSbxaFxaUfv66sLexe
         tQzVCp45Mfbzv9r8A3TLQjkPi0NLfrsa/gieRje0qdc+nBjh7+3vhIb/l61FNJh5qdW4
         DJN9Jp9fa74urCIdffnDIXYEmr3muBkhzUfOODpo3+K9wZeDCfFv6h/lsSDoKGw8oa8b
         w7zVayjrCHlxtJ/Hbf5gO/o5ajtcUjuhdQcyhYWsnzuHAw3np+fUi3ugFgSs+Zuyy7h6
         DCkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605321; x=1795210121; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ImJojB8mFALyxSggJrgCBcWhdVRXQ+JYdH96Rugn+k=;
        b=dTvlVUbir6KpYY8beriFhPzx0PrlBxbAiOz905pEC/fBxc88IEzsXs2a7rX3vc+j6N
         184lD3CHJE5um2ZqgkzwlirKqKlDtw2ProYP3oSzNtVMq35lQfnEe38e6wAKxelatq0i
         XFQzz0FFy9Dp+XgmNOYJXMxMv0mkFo7hwN6MQtz+cNUn6mVH3tGf16yAF1ogQwoFEBxd
         4ys7AzpkAtvMXC5q666wOTO+9oaZZAYk1N1LlyFj/y841ND8RZbvVWy589PukRZwIGRJ
         SseV1KwBZEU95FtIhDtECNHu2cnmeKsiw8Z4uvUMBw3Iid625/7nE6NFCC6EFJ50nUko
         YTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605321; x=1795210121;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ImJojB8mFALyxSggJrgCBcWhdVRXQ+JYdH96Rugn+k=;
        b=SxkP2cbl5ybTNptM8mQ8a3kJuzqAlJ0iCIec7p+Pk2QLjHUcOiLZYZ28HhV8kt8Syl
         j5iy2TScEnJ9PhavQZpggbtzc3bTR0R37Y0wnXZY23e7aNiVi1qrMyYdED93Oo+eMJhS
         IKYwqiI7Amndnd2F8IE8zIn6mHABL1lvKQsf4+s55EvKCYTVJ9Dgxr9pu00ivVMxFlV8
         9GjPpmRaoEgMn3CFSA21b+7IXLp9kmj8x86JlKVZpWKkcCHE4LNQ2GDDHZkxhxtdz2Nw
         i0PF8qLmcgUmQ1szj3O7ZEsBTyvnBO78UPIzMPxZbcujMUGnOno/6/SIAbpJhqUUfUa4
         clJw==
X-Gm-Message-State: APuU4Z8HT9Rr2rmj7naISd3tt5XomlphmoEeMTTm0KlyYn0a6TxO0KB4
	Jvm6CyfcSud0Q0jDU36E7Onx9YmGmWjkLj1QAEO/cq0DtorWWJojMGp3BVAg+BVenowv0xBtExH
	Xu7fkzNjvW/kgiVLf5v37SzIlYgg5rArAYo4r
X-Gm-Gg: AYBFou0jVaLYhctI7gEwkY+5Y8PUG22QOfUhJEffPgnTTjE2PnhMfVt6FJ0LZNKoiBp
	6pqHhdOnUmfyb0+3lApgSbRM0leveM+mTdqg+xHVQ3UUvMmnJjpGkYZyJJlo6C60+Xklmy6D1UH
	CmQKT1uB9mFwWq3qZbHWOo5vxmxWFfY+9EdtjDdvC34As8w1xdWDVqA4kI1gW/W3kSaxVjyT3pb
	JsNNnuvk5SkTQgynJ1QuCQh7XxG5yXHjUvSJVaj8F0mrIR/ZdhUYpOfF3h/9cE+Xx6xxKk2hj6t
	FJGQMnpC6aBNXHsd1+xtmCBvW9JMkYn3Gc+/tHf459hLIvp+n38TE02I/W+J3au4Kowv3a/+k/u
	OHFhQ8nBLsl6i10ObKkabBJxr3WmNz4B3TdEV
X-Received: by 2002:a05:6871:c8c8:b0:494:9899:dc19 with SMTP id
 586e51a60fabf-4afdf79f0e2mr3698009fac.57.1794605321388; Fri, 13 Nov 2026
 13:28:41 -0800 (PST)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jorge Almeida <jjalmeida@gmail.com>
Date: Fri, 13 Nov 2026 21:28:32 +0000
X-Gm-Features: AclHuK_Z7eWnKVrOyawVHO2I046Zv_L2LK13qqdpnTR89QlXTEH34luAP2lDEpY
Message-ID: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
Subject: [bug report] opendir(3): document file offset behavior for fdopendir()
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The opendir(3) manual page currently describes fdopendir() as being
"like opendir(), but returns a directory stream for the directory
referred to by the open file descriptor fd."

However, it omits a critical detail documented in POSIX (fdopendir(3p))
and the BSD man pages: fdopendir() uses the current file offset of fd
rather than resetting it to zero.

If a caller duplicates an open directory descriptor with dup() and
exhausts the stream with readdir(), subsequent dup() + fdopendir()
calls will immediately hit EOF unless rewinddir() or lseek() is called.
By contrast, fdopen(3) explicitly warns that the stream's file
position indicator is set to that belonging to fd.

Could a similar note be added to the fdopendir() description in
opendir(3)?

Thanks.
