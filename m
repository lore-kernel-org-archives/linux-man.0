Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737360;
	b=ZuuT5a7SnDQpdaZi6IieUXIenJl/yIsB2bytIkOxoZjuedaL8MfVDVNXSx6+mtyafS7D
	 g63rgomWroPGufHAdrwWh7Wvy0/isVBbcsHcDDRryjtVFES+JrDQuovghOatXOCwyq2kk
	 LyTUi8OXfHSAddB4j9aG5fTtzvVpUwANBR3Q5pXM/mJenNwpMNUxwk/ewrmx1+1sFL6ay
	 YHTBUvSO8ymoBcsddqggtIrfIhYT+ydtf2eHpnDqxBmccF1dTTh3H+ZQW2/+9jCroyhsN
	 1zKrOn+ZwblbSFp21ZIaGpw+4QGuWQQbzwaCSJzj4pv2WdRDDPUiyZqGR/d+3iexZPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TI3QFPKSF7COvfGKPhqGgdGChtDzn0rFHfP0DP5sXrY=;
	b=lWVQay2Vjo83PrAUgIlVJty1ijEypHyG/jPXsiqWdPV72qBzfb+E9pMdRynOVzmZNhKO
	 yG8BiBsaJdgu2CulanSJa5jlirNUsRcgDQKryKW8zBwGpFHNfacuiXSqySJs05GcCQA33
	 yHpSI9H8s0HTd0TU4vgeAFQgUIK12O2IOXDO1Qnj8r8P1wrtCdO0Pl8/BmQLdlfiY5rwX
	 K6FVZ3PlY91BhGwF6JKbB2ub9A3/CIh1n1gWlozra4U6nU+68yhEn9dRqqXbbf2vyLfWX
	 qtYJzhKxbtPAlmp5CGQW8BZBt1ORCntIz/o5Ji5wVThVhpwfqlJ9UgsofYb03gTARDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFBR9ALz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56A606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B56A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFBR9ALz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so35039915e9.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737359; x=1794342159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TI3QFPKSF7COvfGKPhqGgdGChtDzn0rFHfP0DP5sXrY=;
        b=ZFBR9ALzuprqUzIADsKPCULy0CoZXUgicbqqUMdqrmgyOg9kWynHsGKMORbcTGw4qp
         SFmX2GmbQT7dBlUCb84M1PLGui+TRvZc8o2rGs8rIAallCy9TOL3n/PtziIc4IH2Gd+s
         UKl0oRCCV87hxq1Fs04cA8YC/ZWnP86oeenAauYmf00dvU3lwdF6rwwhp95/ltwMh6QM
         Jf4cIsMJsUy0NPitYp/kZmFAhj6qvvlErE8juXUK9A6DrVWkyBJXxbHN6LBB33yHP1HG
         3IYFK4bnDDTJVTUK3r4T9hJAvQOtpIQTuJMQXCtI65dkNhLXDlGmLLWJQiNScvuXoAaB
         w6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737359; x=1794342159;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TI3QFPKSF7COvfGKPhqGgdGChtDzn0rFHfP0DP5sXrY=;
        b=yPO6umc+qDtqtNomWTDao+zRyirJfxX2FPFS2qwbRAXmztLVGmp7TmEeaY+hCBHP6w
         g9Ux+s+8S7Ntl/zC1YdSE1dE2n8q1EdIzef07lNyzXCxh2NaIck/NnHyt+t24m9zw3tj
         I4o0nlNoYjhjpWRG0CDLy5oAu3e6O06h6HcXpHAySznBM/J4U2xW6o/u1xayDPcDkg5E
         +4tGrvb1AOmwuLlntx4IoV4/lbKu3Nmt+Al3Wq110YhBU7K6uGtWX6PY/MwsTnENMM11
         h2OxW2Vu5hzTBnYiK6hvSyA1Ni8oxF9pklzROLq2qZ6bAJAgb+AZ4990Cbg8hoh5vg0p
         7EXw==
X-Forwarded-Encrypted: i=1; AKwUvByQ3a9rxI7M2BwkQ7upNL7Hwyw1usvc7jaMCZbFEQUNKDfMvvWUGAbYaO9Rqez6Abs0Jaqq8BbqoeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P+1dyELLH/pMiwyctd/wkSTjfQR2cqOsfLYCB05T87yvZcQbV
	afXhuteyTfA0i7kXHVVFFiDFIHh7pXtvqdADKez2IhdwyyetTTiRRgf6
X-Gm-Gg: AYBFou3clecJ/iRCz6MPU7s579wG28HgvcAt2p12nXH9BmUdwngH+8+nhAYCcDAOlop
	zy3daswQYV7xvnRWPZEyWe8UF+kZ3N1Q2mRyhNyQo0Hv2gLAw8pgnjyOIdyhxNnZj/FhBUiJSHQ
	K1l7c/p8CcP0ca2znieo8OgMsQFfctsauCGgDsOzMJ3oUPoxIZNRwQYyzAK1dYozD060pJMZVb/
	nsx+ZeajZTMM6R+qj+nl0dNbTD4Gx04aMDnPyg+h5zz8SrukMFzgiSQgunUqxhZcustDn1N3nnA
	ahrZXqEMCAshOOIsoz+WvZT+qX9ngxTOPY+w5QTnRwgoY4JjwKkhH1/mRhI9WQ2l36914X9EzfO
	uefjOBaUQNFXuZ3eJEyNlaKiSWe4R0LjDOxbRKnLva90xw99u5t8fNE2j4/3q04v9Sbf8uiX4FI
	XoZIjQLsQ+hlQvAbNYJ+ZUU2Joiw9fsiPADwdWN2BX0bAhsyHLxTsiaCAsXr6fhkAorbu0bCEry
	KsMV7cptOIMFdWG8ZXTF/PeLnfeaZFDGifA02d4OF8GqPfTdhyJk8q1oC90k428GIelakDIgkf/
	ht5/3XcohR8zZrzlKooiKCzNIAnd8lv3nEgbBkvXMfCxhjYHvtcmgQ5aCcVcEWvdGRrr1sMaXVA
	=
X-Received: by 2002:a05:600c:6208:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4ac182dc32cmr327377805e9.12.1793737358884;
        Tue, 03 Nov 2026 12:22:38 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa953d35sm83325765e9.9.2026.11.03.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:38 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: [PATCH v2 3/8] man/man7/unix.7: Autobind: Clarify when it happens, and mention SO_PASSPIDFD
Date: Tue,  3 Nov 2026 21:22:05 +0100
Message-ID: <20261103202211.13820-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
clarify that autobind does not happen immediately when setting these
socket options.

In linux.git net/unix/af_unix.c, unix_autobind() is called by
unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
if the socket has no address and unix_may_passcred() is true.

unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
SCM_PIDFD"), Linux 6.5.

Also, the old text said "not yet connected", but the condition is
about the socket not being bound.

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Rephrased the LLM-generated text so that the canonical description is
    in the "Autobind feature" section and the other place just refers to
    it.
    
    SO_PASSPIDFD is unfortunately not documented yet at this point in
    time, but it's still correct to mention it here.

 man/man7/unix.7 | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1695f1c120c7..61f06a74359b 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -296,8 +296,14 @@ .SS Socket options
 .B SCM_CREDENTIALS
 ancillary data.
 .IP
-When this option is set and the socket is not yet connected,
-a unique name in the abstract namespace will be generated automatically.
+When this option is set on a socket that is not bound to an address,
+the socket is autobound to a unique name in the abstract namespace
+when
+.BR connect (2)
+or
+.BR sendmsg (2)
+is called on it;
+see "Autobind feature", below.
 .IP
 The value given as an argument to
 .BR setsockopt (2)
@@ -365,10 +371,18 @@ .SS Autobind feature
 as
 .IR sizeof(sa_family_t) ,
 .\" i.e., sizeof(short)
-or the
+or if
+.BR connect (2)
+or
+.BR sendmsg (2)
+is called on a socket that was
+not explicitly bound to an address
+and that has the
 .B SO_PASSCRED
-socket option was specified for a socket that was
-not explicitly bound to an address,
+or
+.B SO_PASSPIDFD
+(since Linux 6.5)
+socket option enabled,
 then the socket is autobound to an abstract address.
 The address consists of a null byte
 followed by 5 bytes in the character set
-- 
2.56.0

