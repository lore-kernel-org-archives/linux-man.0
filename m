Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5A598BE7
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172019; cv=none; b=RwyamwGLfCLdz52VG8Udqhd9tFbtkagrUfIfOeaRm2AhKgrYRoSZE5f5n/ow+xuNc7Gce/oIH2qt4gFYzvUPXGqZBLUmlSbgFW5V3JaOFCWhPpSPnfPwiFyMFLlljoHLWTUERwZ5u1FKcROEXqU3uLlQRH3GIk6dLQ2c3NCUE/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172019; c=relaxed/simple;
	bh=Ya7s308zUn/F8SbepBgwyVqQoxfBXk1dgCR/qJcGD44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQPWA687dYkwInI4VyB9U/bT5BRN7KjsyhZaNw0fDZfaA2NpeiU3571uUFnBLu6N3RyFaQ9WnCYUKj4tHifdQceJNSo4M8n9nqFGnfNsNAI/l9Tqap7/AsvoZGozJPEHIzAmn9k/l7qysIM1GAFWcfx0wu+L8s+JBrrLfN0Mc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaPcHixE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaPcHixE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so2022575e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172017; x=1792776817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEy4e5DcMuzCnSIMXNN59JrVIjfogtfdo3NJkC8X2wo=;
        b=QaPcHixEM9z9W9blOANcwdaRW0WXEXUzQ6d6Wz5kwQ2YbXC4LLAIQyo3sDBBZt45fx
         Zu8C3GavwGxxNm4ikP5wqJhPkft7SUZNRsI71mF2WFz99qoVB4Ph51BhIc3w9N2HNT+3
         UNRBRlBp2wqaD3SJ/AHh/3FQtTMO/LONHbziQrCV4vBRIGE2aFuxLSo9IA9Vg/BCMO9O
         z71+m/IupwWQ4ViJ6IXaMs85gm0Kd+e/SluMZj1vxhoWncTPZXVHmGsTHgQsdNYgVswP
         3Fl5C8T6DvzGhCD1otYElig0B8kj5YJCzkHQznW80B7oWcAAnejF6//vbAALkmPzA+G9
         JBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172017; x=1792776817;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEy4e5DcMuzCnSIMXNN59JrVIjfogtfdo3NJkC8X2wo=;
        b=tSc2pCuHRZ9o1opwDNEfwvlzkBKbicVkI01AtoAl2fSFXM2f8ATRmq11tffI/6KA4v
         2QbVQNzmMsNCSvyMmPXakA9k1Xjl/3+rpEERhwBaX489y2B5MOhKrUclbVdS5+5aapWL
         AASAfmQS1usJylMS68WnSZ1YzX9HqVvNko7tQm/nMZ4Po750iyDUdIxvmiBJ9klJ4Q3Q
         HQZDv3GDaIphFbEdfOpYCjPUOp0qFnScRSxYAMqgZ94I6RubGyYIcgz/P+atqb4Wqfhr
         JnUq6yiD61XzEG78ehkkJDppdr4dSasNHphVKrmwXbWRdmY+FB7TgPrf2NZIFqJCPdCc
         RouQ==
X-Gm-Message-State: AFq9FYIsd21DlsWUj/aRqlgHYjGMzzNne5Zk0XFS62CnBzLcNtQoo6bG
	iLdHfunXa0mND1ff3VKWnFPGtNIhRaLen9w6Bi0wbiZ8R9noJvKQfEcdI/9F87RR
X-Gm-Gg: AYBFou1r8bkwx5VJLNW4qMOlvSfihXIX585xzCXGCXutHji2KnDhi7TEyItbGwVktto
	gn5q2otEcR4ejFyCYisqLv6fa8fhJu8QAx89cmBip7xSn2e3xCLW1+kGTVCMiL91K2ZshQ/yI+A
	bcRFNjk8ZLUgmN6iLPRihuy6tf21R6EzCgJiGFMC6nami4IwotqaGALS0qc3nyQmTUlxodgL+LC
	ohBTb92UZ5QMqVUEd18jGmVgU1MppPqDfSp+285saEeVUCZv8zHsG5ZNv+uTg7gprD6ibsHmmZ+
	j0H3j3RpkUkD0KcEkntppbFQiGbLCD+nLfdk6IdfwLRMpo85sVwYGjDddZO3LBQPz1sZeHSCXLt
	Ol9JcI8DOm7LTrQXNnYhGg4a2dRZEq1emWPsBT5PY056GUoJVu1O25arCGXIIiMUcdSkB0OoEfz
	4ZrvKrEmchEX7iVvmE1eLNy16Rs9ff0wNU5u9J3QufE5Wh7GUkNuwtyr9RgikMi4Agg3YAp/qqP
	vRfz/kkc66YW5M/yn0ueh0=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a1d7600183mr9919245e9.5.1792172016609;
        Fri, 16 Oct 2026 10:33:36 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm6359511f8f.44.2026.10.16.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:36 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 22/24] man/man7/unix.7: Remove mentions of unsupported out-of-band messaging
Date: Fri, 16 Oct 2026 19:31:37 +0200
Message-ID: <20261016173139.13076-23-gnoack3000@gmail.com>
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

Limited support for MSG_OOB was added in linux.git 314001f0bf92
(2021-08-04; "af_unix: Add OOB support").

Its removal was discussed in [1] but has so far not happened.

The support is conditional on the CONFIG_AF_UNIX_OOB kconfig option,
so stating that it is supported would also be wrong.

Link: [1] <https://lore.kernel.org/all/20240409225209.58102-1-kuniyu@amazon.com/>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This one is authored from scratch by hand; in the initial version, the
    LLM spotted the inaccuracy and then proceeded to document the feature
    in full glory -- I think it would be the wrong call to propagate the
    use of a feature whose removal has been discussed already due to low
    usage and security issues. (See cover letter as well)

 man/man7/unix.7 | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 8d1a53948f5b..bcb58336a1d8 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -401,14 +401,6 @@ The change to 5 bytes came in Linux 2.3.15.)
 The following paragraphs describe domain-specific details and
 unsupported features of the sockets API for UNIX domain sockets on Linux.
 .P
-UNIX domain sockets do not support the transmission of
-out-of-band data (the
-.B MSG_OOB
-flag for
-.BR send (2)
-and
-.BR recv (2)).
-.P
 The
 .BR send (2)
 .B MSG_MORE
@@ -780,7 +772,8 @@ Socket operation needs a target address, but the socket is not connected.
 .TP
 .B EOPNOTSUPP
 Stream operation called on non-stream oriented socket or tried to
-use the out-of-band data option.
+use the out-of-band data option
+when it isn't supported.
 .TP
 .B EPERM
 The sender passed invalid credentials in the
@@ -883,8 +876,6 @@ at least one byte of nonancillary data in the same
 or
 .BR recvmsg (2)
 call.
-.P
-UNIX domain stream sockets do not support the notion of out-of-band data.
 .\"
 .SH BUGS
 When binding a socket to an address,
-- 
2.56.0

