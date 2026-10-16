Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B41582BAF
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172002; cv=none; b=YHWZDKi+j3eNKz8AKwJPVDd9q6mHk526bbNbSbJ7JJ/fTh4Tkso5wKI6H3zxu+14SsQDDno3kF0jOZtnplJkcG2gtoOQpxGD23cUQ/53ziKWmYDB4WUkqCZ4czWVzNerfhHbU7Wfijbb3Y9qY3ODXI4G5kR4XG7cb3pJ0Iyh9HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172002; c=relaxed/simple;
	bh=4t3uyAGzVr2O2KoL2FpmxYEwbwJIBFPQ/dI3ONrb3Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TOxgLhHYg+uPAfHs+rWOmMsdv1ufk7FYJoyuIZj3Ncy7gXw7mHUaytnAYAtMGe2c+ESsanIOa6BhNgfDr8/meCqMmQnCH3UgzjG2Kf1G7rSzgPg7GZq48Giu9stQrDdCPV4sL7CGfMH4l9h5+CHrmRZsmoD1sdj3jTXVynILOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKb6DglH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKb6DglH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso2081935e9.2
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171999; x=1792776799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HEXk0Ijnvg5vIFhYk2BlNi3Q9kQN5RuSmi8IpaXGY30=;
        b=YKb6DglHjEEOyoNFcAsMz3OeZCkRXWJjMcWRvh5g7VQDPDDo/1cdNTgSClNu5ogM3x
         Rdplti4rT5HDf8PW2hBB9QYqgk1pRYVN0+HLItlt2/a3N7GNBWSmqGX+sQ0CwosLyfsa
         ScG/ZwKrPKZncDXkzo1H1Kg94xVgJpctjjPkdEr2BgMd+OHPg6RTFuL3G4o2n40Wgabq
         qnNkF78KIZxIOgedbpVEbFIzVAckMiMF4HFXDkWVwF3Wp+nnyYltMX67SWsO6jt/xGJn
         0t45r3pOJw+aIuhU5KPeyOnxPz0Qw7HE7STOmEB8m3q/rUAeKD57LBNRq16XxrR6XU/0
         ZuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171999; x=1792776799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEXk0Ijnvg5vIFhYk2BlNi3Q9kQN5RuSmi8IpaXGY30=;
        b=hPEp4GwTMVEIyLMkVb//OPoVTOLlAf9ms7n3H3Ld/vkjl/qgHIY8o/K1H1PPkVpzQc
         kUtIpihTz1wjBSwHOk3CXTesCkv4T0WkEAJkSicYaF+cTvOD1dGxnkgxUBdmYmLRskSq
         uNa1k+r+Hs84m6NH7PyTYlRvkaDC2/KKpyTqZOR4PHe7DLZB9fP461kJpwJ7JBIkTIeQ
         cgKNSD3xFdE75RQy50yxlRtDpaVfWk1I1t06EK8rCUDE3h0n8l5OZ0zr0FCEEhso3X2K
         gxxgg7pFjiMlLNd36xtdMIGSEHB6gvId6D1de+k6cZGWsE6Ft9dEDN9ZobJOGeVKDB20
         As9A==
X-Gm-Message-State: AFq9FYJ4MTLAbbJHuU338XRd5g6F+/Z3g778al5K4pank33O0l1AjvoP
	eGirGzkIPOhcZiAb+w4q89ioHE6xMDG2Kzvui3amSg4BHuNm4C23DEnGlnU2q+B/
X-Gm-Gg: AYBFou0R03r8rw/dwhuLoIw+17BA82269heLFJD+yw7t7MlYhuVyEKuPPdMjeHTza81
	nkfb+Dv7RkyZNcIVke/5eL6MLaO8elsRIIiODbgiFd2lcXmxQ+/SjdIt1N9fPXDVPCj0+LBZ6YZ
	SlSUJZIAjmS9dnGTzjsfPXU6qEnJtMiijZ60l75ndtankA8xT2h7g/ktzUgzkgUCSMPi+Ptj9Dn
	dCwLDSgZ4bjsnKYqDSOVHOrqH3uBOknYKoTExiGu9vnus6Pz+hk4svw7Rpk3jarlixSrpQ8Dol9
	YvbviQp0lP+aasz8wEwPmmwbbUiv8QBA5sueEcu/jCFvKDlGaq4aGSlmjXEDW4AF61BEBFlx/cG
	ivjbP9kMRxUxOc6SUFU+niADMi+UQDdBMYzv+lNBDhBiyP9/LX5BrXhlpjs2IEMEz29jI06ImbK
	q/+oVqzjzXXOSCczMjbiEC1kdWXnmnCIjfEyt31acGDl6lPbH9EPTcQEjNVOTHxi8Rn4akGr3HL
	jjE5X1Io+uudev6CgVEviY=
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr11066395e9.24.1792171999458;
        Fri, 16 Oct 2026 10:33:19 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm53078605e9.2.2026.10.16.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:19 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 16/24] man/man7/unix.7: Autobind: Fix when it happens, and mention SO_PASSPIDFD
Date: Fri, 16 Oct 2026 19:31:31 +0200
Message-ID: <20261016173139.13076-17-gnoack3000@gmail.com>
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

Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
clarify that autobind does not happen immediately when setting these
socket options.

In linux.git net/unix/af_unix.c, the autobind is done by
unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
if the socket has no address and unix_may_passcred() is true.

unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
added in linux.git 5e2ff6704a27 ("scm: add SO_PASSPIDFD and SCM_PIDFD"),
Linux 6.5.

Also, the old text said "not yet connected", but the condition is
about the socket not being bound.

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

