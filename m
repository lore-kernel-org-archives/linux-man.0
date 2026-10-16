Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9D57ED84
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171988; cv=none; b=l0qm04ByfRIzj559krecM+E9mF8oUVEbObAn8ZNidbaFOOd0h9Uhd+t6R/VWlBiTQKIPDQDEO8bnrJdLfVKd10Ne8Bob0Xq14cIXJp7A/QIyDphFOJSxqUz6Vux7c4mge4nXpCD3lPeCGQHPqGA3fqFmASnuDQqoRSBEi0ZkunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171988; c=relaxed/simple;
	bh=gTdZJJT4AuD8px/pw7Sjp1XYEIiqQhrP3yyXri58CnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6hBDQ37zVMJqy5JSGzb14FFKJr+dWA1uLm3cP8gba3ZMI+tXv4SsvgUpzgZovBhde6uSvnZKSPHnIJ+NIytUF9ojuyKuIGZNFU1OxTayKJwhISpIjurGknlbIEGRLYoERKtV8aNGrboYhbny0AzjzAY5QDB+Skyyv5L7NkFpVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYeVBUCT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYeVBUCT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso1094685e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171985; x=1792776785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vuz9U1p1byPSkyMI1tUfCZcQ7RF0QSjFx0Xo2sZ41LU=;
        b=hYeVBUCTfwUsjW9hyUfY3HszDbNimc4zVox0GrX6teg8Ix+VGplxgWZSygC6VsD2yq
         2ciUAul+lWE2xQgef9OuNH/c9eipfk2mA0Fqkv4F1znO3CppiONwc8s9YCLTdxDvNDlz
         CJqCT98RWjA5VSbFCEeHJXFIfAo+0LYlOYiDFj5ZdkPpavzrNSYDBGqHJv6mSXMWwwHi
         kkw0guzEVoR0FJ1sJmScaMKALiv9GPXoVAsfh3RW9U4lB9U2k20e3RTRXPTQlxY2LUsg
         cI/It+PhHaS4SMaGwCFEMnvEbLy2Q8QUgge5jLILpZ3k2rlqaXo/a5Msx4PDl6GGvrG8
         4xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171985; x=1792776785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vuz9U1p1byPSkyMI1tUfCZcQ7RF0QSjFx0Xo2sZ41LU=;
        b=f54WLr6JgwS1Sycw/Ci9pM98UFVnyp+mr/qprJt8oKY4arQpwbWvXpqjeuw9wfRZVR
         hrL5zlQ0EVBeNPOPIoDhbGMo0FR4+DQ8mFt+MY124cRV8h7vr/ki8zDX/mUoDAwYZrO2
         glCA8u1iVJ2KB5mh7ASUKDop+bAbimkEhl/5VPqBHSNFgH9iw8hL0GzzR5bmOo1E9BZ3
         u1IyybKLwkl19PI3T+4UkZrXGug5A3n1MPMwlUajHR0cOeLMjyP+el8Xpp36oWy3Ou+U
         42A7EFlfqpNvXJ6MZkyuFgNjXZawjiwqbbBN+cmRfSYKnGAdxv2EX5In53WKmZ9W1+uG
         DdqA==
X-Gm-Message-State: AFq9FYKVzMIDskHUeMpXuq97UjWGgF0HWgWUQOFhtsKDfYsmnaDP6Tp3
	mQXbhVbvJcAxdDmHmlvnGjjb/VXFgw45TzApU/zVes2Ok8t7PaMm2dAZJ/49gsiF
X-Gm-Gg: AYBFou3vXE5pOUEBH58RQHRBjq/kmrI3sqVM1uYK3uPqPEnZBxDZgjlaIIJ2xB8Gl4W
	NLlWOIWoNUxlQfVsIHPp5pcbldXnCWo9Dd6DKb5oTLHyuBF2j0gm8nA1dCE1qqoJxHiV7KUZy6C
	rKK39W8I/M1Kvr/JlvE8qqB9tNUagB3FYb+pIcHbq3INj39BMrNA4tp96po4r5SQXQ71w2n61K/
	VnuyH0FvBe00edDibyUREFfmv9755Iyt+478w9SqOlxAn4hIi+tVLaxE1vq1qsR0JzFmAvF/mkl
	xx6giMaB2HEV1jvN66lkc9jx8xe3sWUYHnZ57kGiU8gadGlmkMBy7w4GktRCEuZlw1LTYu88Non
	yj5viRa1Z1+xNEcSeFu1RbntUEPDHl8lGCpHzm8zIesmWHdrV4qJbfdOWx7PWBXWHCL3vTuw8Z+
	EXq4rNyMh2lwSvWFWd9YmaajnBlZFB/PYBnKl4a5YOTc5uBGtQn3EYjCCRoozZjjEEjyTf45wlZ
	Misb3KncG+6LXZGF8bzAlk=
X-Received: by 2002:a05:600c:e555:20b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a1d75fe6d8mr8228705e9.6.1792171985049;
        Fri, 16 Oct 2026 10:33:05 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm53064195e9.2.2026.10.16.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:04 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 11/24] man/man7/sock_diag.7: udiag_states: Document TCP_CLOSE
Date: Fri, 16 Oct 2026 19:31:26 +0200
Message-ID: <20261016173139.13076-12-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UNIX sockets can also be in the TCP_CLOSE state and it is possible to
query for that with sock_diag's udiag_states.  Document that in the
description of unix_diag_req (for querying) and unix_diag_msg (for the
response).

The implementaiton is in linux.git net/unix/diag.c, where
unix_diag_dump() filters on 'req->udiag_states & (1 << sk->sk_state)'.

Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The full list of "supported" states here is technically more of an
    implementation artifact -- the supported states are simply the states
    that a UNIX socket can assume.  So the kernel code does not explicitly
    check that anywhere, it's just documenting the states that can exist
    in practice.
    
    The initial LLM phrasing had added a section going into detail about
    the reasons why a socket might be in TCP_CLOSE state, but it felt like
    that was anyway obvious, and the phrasing was a bit vague in that it
    only gave an example.  I deleted that sentence and only kept the part
    that adds the mention of TCP_CLOSE.

 man/man7/sock_diag.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 8f8b28b4404d..20733cb8c8ae 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -151,6 +151,9 @@ Supported values are:
 .P
 1 <<
 .B TCP_LISTEN
+.P
+1 <<
+.B TCP_CLOSE
 .RE
 .TP
 .I udiag_ino
@@ -307,9 +310,10 @@ or
 .TP
 .I udiag_state
 This is set to one of
-.B TCP_LISTEN
+.BR TCP_LISTEN ,
+.BR TCP_ESTABLISHED ,
 or
-.BR TCP_ESTABLISHED .
+.BR TCP_CLOSE .
 .TP
 .I pad
 This field is set to 0.
-- 
2.56.0

