Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81163F0A9F
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345067; cv=none; b=aYDbwpmiEemMN7cmKqL5r3oEvI60PDXx8qd9X1WNPEoW62rtEehqHC6+bjdnMtLv7U+J6PB1nZDBhm+7rdRCTURYUPAIEGFo9scg1/zKwiX5NU5DOWMhcBNnh56NazKkCpgk4A/YS6xhb2jLb7FDkRp2ZCudyyvD5mjx1xTo/L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345067; c=relaxed/simple;
	bh=hg/XbZGAefIaiFtm4jnJfkcySiHueeVyp9zT4FueOdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVrWhLhFBAwCXr0On8VZ02dt+KpVkPQUfW5RTK9WUqbNLzJa6W+mW9Yhr/V6ZUlRs9UikLm0K7yqDVdp6Hx4SMnfXBZ/uUQPY4dHYUWfgeO7Ixp/Am+O6KcOKMvxMECR7JfhAMybD4Mkl5H4EZ0i3+VLF+YChKZR8uNKJ16JBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDPj/4qC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDPj/4qC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so784922f8f.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345064; x=1792949864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNO60K+IARuSWU1GG7U3sgcJzXd/6AQ3Jd4eUWTxe34=;
        b=TDPj/4qC70vmP/jJZQDqWubH9zlYNDDgROgwcFDXF1X0alGTxd/a3KEayYty78PenQ
         s7FYbpvAOl9RYGRKZxlVIo5x0s76FmnawYtw33gA98vMjZbDc7Y4hKDIRViQFtEvbcQ3
         JNaLXdKHLNrkcL41+6t8Cq2WyN448ZNtvyx4nZhrs2Igz7pSyFgorS190NwX+ZwSJYM1
         sj+lXUCUUZ8CAp0ZlpF76rlC9ufHKek42scWE/B4spS/+TCQe4QunToELYv0MQN0zxJW
         tx5pOPOfngp9t5h6CGrCQqIaL6st7oXLyEWLBD7rulrsxIhMk65j1drWnTjZokvBKNYL
         ivtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345064; x=1792949864;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNO60K+IARuSWU1GG7U3sgcJzXd/6AQ3Jd4eUWTxe34=;
        b=tzaInCDk11C+5lqm+H7XptZhVtiQWyCiYpGZqh8KH/YHyU5e8Lzd1JxTpCHjox/+bQ
         nRxmers4SYKgFNAGBNTzWsDIctxcycDYAYudLM10GR6bvNnI/5jJeKqrUYSZpaJ7Epdq
         kFvgl0gYDEgpyCVuZ3bX1naPS0/E4PHxZQxTPG1El2EHqMKDC5isiWQR6oiDXVUHUs4i
         hZGgt+rDshE0iETD4GC2S9STM6VEDTSeL4bnZPLXkN/91OKxZFmIPIuCZhUhKcZjgoX7
         xJEsIhFIYQg+r6pCX11Jy8qoM9hHhMtsUOFvWbb+pt5nZxArz6zhnh+BDCRTYze+lk4B
         kt7A==
X-Gm-Message-State: AFq9FYK6ID9BD/gS9sIXLkVwQ6h4oNhkBxPxkax2PceqYik4AMIH4HHb
	A21ZdArV8r8hEykV6o7CfD5tUeDXrtUmW0KPhGeB1eZAVp84cp9gUT82
X-Gm-Gg: AYBFou1upTfTzCzQHwEvSHiq9uP/dJ1gCrHcVzr4Jp+VD0FtZJZDuygm+9UYD+b2R9K
	lmM/rpTYBCH/musg+6VjUg7qVS+cneHPSuz7A1LMyIxdCAW7ZxX8hoefdzwQS0p7I1yyjfh4VoH
	6lAXuXyT1MLkEb9Agr4c+4NYyAtWLHecUelxB1r/IfUrL+lhQcz93rMV2gAKyCfrVTcKIEhynHs
	Ij7PKfKZn46WDh39UQLz8zodhNJs0MpLRiuMuVtv49w2aCXMyoraGX/m12/pUBky7PM8pUZTJCg
	C6R91YdJW3Y063Z8VSL5vavHPV6Hb0rskP/vJ5+8TBBrLk5iaw1fDAgyozzUez8Y3ZP2Cjf1A6H
	tjJBJ+GrjqKHmCRATk1R3ezroHMun+PqnKodFn1qvTxfraPCD70ZD1lwmiOS/sMEJRvW2AbACDJ
	tU5kkKaCQlSJmWKUNtrPN9dWKatLnA3wbNeMJvghTXmD9xc+dFK4PXdfOxPV3kyiibwtSJHwYUf
	B3Gzy7SrWD8jbuJguTL0GQ=
X-Received: by 2002:a05:6000:4b05:b0:48e:c0:9441 with SMTP id ffacd0b85a97d-48e07f9d7c1mr11322316f8f.29.1792345063850;
        Sun, 18 Oct 2026 10:37:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5813sm25305286f8f.17.2026.10.18.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:43 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: [PATCH v2 16/24] man/man7/unix.7: Autobind: Fix when it happens, and mention SO_PASSPIDFD
Date: Sun, 18 Oct 2026 19:37:04 +0200
Message-ID: <20261018173712.27670-17-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
clarify that autobind does not happen immediately when setting these
socket options.

In linux.git net/unix/af_unix.c, the autobind is done by
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
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Rephrased the LLM-generated text so that the canonical description is
    in the "Autobind feature" section and the other place just refers to
    it.
    
    SO_PASSPIDFD is unfortunately not documented yet at this point in
    time, but it's still correct to mention it here.

 man/man7/unix.7 | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 480a565f7d04..e5cd2b888ca9 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -286,8 +286,14 @@ if the sender did not specify
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
@@ -355,10 +361,19 @@ call specifies
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
+.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
+.B SO_PASSPIDFD
+(since Linux 6.5)
+socket option enabled,
 then the socket is autobound to an abstract address.
 The address consists of a null byte
 followed by 5 bytes in the character set
-- 
2.56.0

