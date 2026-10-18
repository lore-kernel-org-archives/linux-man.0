Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978273EF670
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345062; cv=none; b=dCUMojBy8u3TQxFg1BJfGhiBa5v5w8vJbNq+3lrwqGuYsoFT9M+TGMaOTkTUtA4RPviJFQaDGvWZHFl8D4UzNIzfGKMQBTJw+aa/nhnN6r2yAedphHmpGQdX/vSvfcL7C6kifzx2gXGADbgc34tvmh4Q7FjUs11srDTHiFxxsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345062; c=relaxed/simple;
	bh=0HNoV29GQnivNpn3RqaXiMevebor1qImvoNkUMtyIBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qj+OfHFQ86p3iR+SxEjVkXTc+djAFjRBiDfXYGeK8P9LFBVPmORYXVP73jL7GzxdlYya4Kg9mISPkniSsUwhFZADHAvvSgd+ai/3ZIOXcz+SX2Kqs1Lj/T3ZU0k303e6t2/iAf4mWJbmazyAeqb8pPh8Rye04Xdp1So8ip1xfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQ+vdgh3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQ+vdgh3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11700925e9.3
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345059; x=1792949859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAzSYgy+pFXbRcfRlVmbGR2N9SD3JlWOaG8e3UJQ2sY=;
        b=pQ+vdgh3+wwpxwSXIJOGsQQtPeETgjjZ89Ds76/3MHbr1EMkBTnUPuSR8TNCp+BeNc
         pufPdBg/eKMPm57aIvp3wd8o+hr2JMv+lhhCaqvo1Wnse1lMFGtmSqn3Q/VbW8pi/mmF
         Yw8xHFQg3Al1J6JOx2+FM3dbSOO3kdHfWg4eu8zNfoDIpbHhVpXXSFtTUFuyDFJ68k7V
         oOZKG5WhdrEhG6ydpSQvWohl0k7Ym+dPVB4j6MTI2881B7glGOSWeDXCxoTzsll7OuSJ
         ct7ToeuW0FBpBO4Cry2855b4wP0wIcHaYSYu/wqR1nRytK/T969edXC3Sq0QucZbS3FQ
         oDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345059; x=1792949859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAzSYgy+pFXbRcfRlVmbGR2N9SD3JlWOaG8e3UJQ2sY=;
        b=Fh0ViRnsmpL+oCIv4YuZ2AkvFxuKCv3MKu7afZN/1nFnlRJugfATGn3/8j8CMG8t1y
         CuhOCymgu3SZltCHMyrjNpbY/zJjqyxoPN7x7q5V8ZCfOb7NSuEDLNBOe1gZ0y384nju
         uM1re/Fcn7wiQaWH4UBTW3yi+3LueECBWOjISywhH/BQ1+zjjBBarKjO3Ar60yMiC4tF
         2bYPbYvIM4Q/0VanXpGjN1Zdxqdd46wj+0DDg5NPyMH9D+lMUHlkVt3IacR0CjXZJwrC
         N1Cbg6V0wwnJVOdJEimS/2WtqIPEFdIBlTjaC9/x36hNLLi1dT1QQUhqGU3SzjHtht/s
         qWVw==
X-Gm-Message-State: AFq9FYLilopc8iwieollJ5OsERKO8ocOaD5GEHFnCrgWSq7ofgSaZNYo
	MUX2eiVfQ9YOMjwPOIR6cduwAWY0keZcM3pGuTUo8kmvQZ4m6ODegJd5
X-Gm-Gg: AYBFou1+jKQReWNcy/wJT8JVhXJ17m/7AJz31hWcTYO1WH6hwTDS1vb08PRVObLe5BX
	WwNn+IErvY8Zi5bOhlTjOSCb3brnK1hDCWJ90Gnax34gdLYZrPfwiRPTzhiZwPLZTccRq5I1tcz
	OCitQ0MUOUIFN15wQOPHId3/zyCHytOL3NTjtEOwfKYO3k0h+4p2HBCDUyMm9aGXhKfWz15FmLx
	Jk8+83I64fP8mEWsPYicDV9NM7ZDxrtj47+6b9vacGv6mKgoanwV12r2MdzgwCmmxizwNfVUYfQ
	IuWyXzH48XqmGm3VqoRI/Yo7+Q3DbqqUdMCL8G05cz8Tb6+4dN+stLX9xICrP98LfKUnGllid+V
	ArrsQKifnD61ybsMA4ScVWybMXnPYrzmqIr7l2K3qV2PO4PRCweUDp4TYdJgE6baL18KrW+7H0a
	uc+C6YBEl+6ACgAx/KHHZnt1JGOwlnkKmNYfws8iLdALZhaFiMWo9eCj+OForLLKWwxADZXuJP5
	IRz1e9ELr8jcv0tSAX3UFQ=
X-Received: by 2002:a05:600c:6095:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a1d7601a55mr109812295e9.18.1792345058677;
        Sun, 18 Oct 2026 10:37:38 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5813sm25304872f8f.17.2026.10.18.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:38 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Felipe Gasper <felipe@felipegasper.com>
Subject: [PATCH v2 13/24] man/man7/sock_diag.7: Document UDIAG_SHOW_UID
Date: Sun, 18 Oct 2026 19:37:01 +0200
Message-ID: <20261018173712.27670-14-gnoack3000@gmail.com>
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

linux.git cae9910e7344 (2019-05-22; "net: Add UNIX_DIAG_UID to Netlink
UNIX socket diagnostics."), first released in Linux 5.3, added the
UDIAG_SHOW_UID flag and the UNIX_DIAG_UID attribute.
sk_diag_dump_uid() in net/unix/diag.c reports sk_uid(sk) as a uid_t,
mapped with from_kuid_munged() into the user namespace of the
requesting netlink socket.

Assisted-by: LLM
Cc: Felipe Gasper <felipe@felipegasper.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This documents a missing sock_diag feature introduced in 2019.
    
    The phrasing mirrors the phrasing of adjacent sections about other
    features.

 man/man7/sock_diag.7 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 9a2b54a67b30..c82b24fe1198 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -265,6 +265,16 @@ The attribute reported in answer to this request is
 .BR UNIX_DIAG_MEMINFO .
 The payload associated with this attribute is an array of __u32 values
 described below in the subsection "Socket memory information".
+.TP
+.BR UDIAG_SHOW_UID " (since Linux 5.3)"
+.\" commit cae9910e73446cac68a54e3a7b02aaa12b689026
+The attribute reported in answer to this request is
+.BR UNIX_DIAG_UID .
+The payload associated with this attribute is a
+.I uid_t
+value which is the user ID of the owner of the socket,
+as seen from the user namespace of the netlink socket
+that is used for the query.
 .P
 The following attributes are reported back without any specific request:
 .TP
-- 
2.56.0

