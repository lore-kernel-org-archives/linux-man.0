Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616909;
	b=g/P11YpSexQUO6hnR8hkiHwgmNx73rAVLiFSsmtbZFfgkBR5K2MYsYAeVOgPzPpJzXyo
	 6cHD1v7ZX/e03R37Ke3fsVRJzVvUktqGekMEq9fgPUq/ZCaYbVgjJpnVs2LStZbagcEQK
	 Jqe8VSRuetuV5tjO9f11y98M8B2eDCACGJx7SFKE1fcKnOSV6jy0FNek8J/a2JdnO5a+q
	 fXgyZUsW5dfKKdHlEzcptf6zWlezxCT6fg9yXJnNv9fVNiV532a6uyBVgZqa+0u0SvX31
	 z8I5VOt70u3hrdOlwuHZg5J+RHTy6iCtjbLH+u3fZwOR4sINk6IQRlZumzwOvIhxg/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q/H2k8saEJEhl23axJvu0C+QyduLN5MitAgCjlJPqNI=;
	b=ybQ/pDQNYXh5z/88lZTGSQJ6zAQY3pF2rDtZYPo8gWW8B1rMceW40NwuVjDjhvCb5+SK
	 TCcgpJL3//H+2OuF5Ga1PV9/6o7j6BPsEGODGQ5l1JlwyksXs4UVjMdq58C3xBiSdhHGY
	 7HRGugsV44boXub/AjBK4MWPXnkcMXA5shzKCaV3Zs7K+waFcTq8dLwenwKAL7SPt6k0x
	 8KN10HbD1SuIppan+oqnI85q4n4aSC8xRVA4Db9ETnu6bjMDEPB+oflFnpycx1vo7mkvx
	 /CcGzfoaUBIp5R8RDZVqu04WgHE1tqUQIZ31tHPLLagRsSfe3iEEWV9O9JLGUt30fxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYfmMaD5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5851D606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5851D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYfmMaD5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso15435225e9.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616908; x=1793221708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/H2k8saEJEhl23axJvu0C+QyduLN5MitAgCjlJPqNI=;
        b=UYfmMaD5gbe/vWH/rlxP0FIIs6yJhXbNCvyK0PQuAcE9FGV7qogFOn/aSaUqkEGnuV
         9bQkMq7u1KUL90qk2yd/Q5lyslSqnz+rOEYFzvEUgyxR/U8Rbbmfryqre+HqgdNdMm5G
         2jPn0SM+ABzvWsQHGOfUlj2It4yDrJbC/07yIg66IqXz0qvG9z83A0xjyX9PzQ5cTRAB
         CfnMZfqd8hGnSeBJGkmbyBIXeUL//rbnYcHc7yE2Babd6z6GwaoXMKYPF+1Y3jeTc6Sz
         5fPnlYOlZiZR9cSv6psMSsmfvuLCB+AjgafvOEpLCwJukAqd6mXuHowvjquYPBq37KrP
         Gxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616908; x=1793221708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/H2k8saEJEhl23axJvu0C+QyduLN5MitAgCjlJPqNI=;
        b=EXgrmZRpF3PuqJSPZ+UILcVYavgid+jPSdzCchrbYQNMoW31Hm9oDNhHMBfYm7azM5
         n104K8abQMWpc41Vl1hKaeCO+X2Y0S5XG7uLcZSbV4pa67DLfFElrIEdNMaoa3ocEfWI
         SwuVApRbnGXhCiemlNPAenZ6f2GK5J/O27S7N4QM6E+JqALT2qQsqInZbhSmcTeIixgt
         sda0LudIcMd3DWf6WEZzYWcEOJPkdgUEYGTuIo0y0eiEwJE0ZZ5bI1eW+JDPGSPQ50W/
         TG4+rHVr8bbKy5+N71XUfVbLhglL00dsUnRMLl/oJz+yW85e7iG2/0zb4S2+FIuKTVkG
         T7vQ==
X-Gm-Message-State: AFq9FYK5ZvZrbsxOjQ1ons8BGNK4d0eQlqvLA6rpztEqGCiGczm9r3L8
	oNs/cPXahkRh7H141i5FxhSIbACzmcHaI6rkHenyRv5RB9fii8G3wdK3ZnMmzCjC
X-Gm-Gg: AYBFou37qrZU3iF3m78/cz2qsh6JtpTVVpGIzIy9UlzlBiCRz/HY9pVcFxwj0+lKTGJ
	uSCjHS6JUVkWoLy92qeAJ76zob8pBeLJkwwWDD2YnHJX0nFr2nuBaw2uDszyr2GavxKFMl9c9xk
	sQqWpHEW2J43m54LBdRJIp5/kOgjeyLcQfCkSRdTlYNnzyQuRGTmfYUGWABfiEhqz0CjG8wWM2T
	NDH669N2P7+24CoPVFOO5+XWLDCI+ug+ZgL8ZhI87yJuzkL38DZNhgXwjKj7eBO+Ke8ga6WxmSM
	Nmi3ELuOyyjAYYVZP86wsOhJ8yHK+Hxn2xBB/zhtFIgLV5+q7XawTKI4cQ0WiCVYRDXd0iXztIV
	uBcyMBvVvMYhqO5brqa0HGvSIb3fmw1sBFtW5ONuAkQqeZEnPWXORUUuXQgTLF8vVFtJx0MeSoz
	A9XmOovUkrBF64JdyJMp3nPpmTsExAMEG1iRImbV5RWTlmQkdOz9pMwoeDb0WdU17XqttnkaoAE
	ybQXNEk35eWAd30TKIWh5uJqlmVVrKYnJdvCuwFjV+Wo/+XfwoSlLy81GSdET3m/4egbVRCDbsx
	iBdk
X-Received: by 2002:a05:600c:6304:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a1fdd4a619mr72165585e9.24.1792616907694;
        Wed, 21 Oct 2026 14:08:27 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm76198065e9.1.2026.10.21.14.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:27 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 7/8] man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is required
Date: Wed, 21 Oct 2026 23:07:59 +0200
Message-ID: <20261021210800.27338-9-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021210800.27338-2-gnoack3000@gmail.com>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
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

In addition to the search permission, binding a named UNIX domain
socket requires write permission on the parent directory.  Bring the
wording in line with similar documentation for EACCES on other
syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
rename(2).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Reworded commit message and made sure that wording is in-line with
    other man pages.

 man/man2/bind.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/bind.2 b/man/man2/bind.2
index ccb77e553cb2..6838a9d164aa 100644
--- a/man/man2/bind.2
+++ b/man/man2/bind.2
@@ -150,7 +150,9 @@ The following errors are specific to UNIX domain
 sockets:
 .TP
 .B EACCES
-Search permission is denied on a component of the path prefix.
+Write permission is denied on the directory
+in which the socket would be created,
+or search permission is denied on a component of the path prefix.
 (See also
 .BR path_resolution (7).)
 .TP
-- 
2.56.0

