Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1723876A0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345077; cv=none; b=rpygYd9IbhZ8kxRxdcm5rfQoFzEDJpUHXYs7Kc+nixBAK+D9XxvWYFY15bDiTMu39XgSb4bf7EsS0dXwicaKsUw9s2YBiXGT2x8OMCHyPpUaNbmOgc271Oloh98TBb8tQ9fDBCFSEK3sHbttOTiXkf42XmaC/YooOrVHGv/c274=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345077; c=relaxed/simple;
	bh=z2An0RUzI8JFd73zjn6tldg2FL/tA9hBM/tcoH3/VxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6ShQiZq+NFRg773FrrivbqNKO1L5orSUblz65HOo+sUJLyTnBqYaIp+iSUqEFSEN5EojSnzea1dLTEKgc7CndoBYhmg9B5/h2LgcTdB32ZzjW2wvYOGE6bSy9hlOhMsfV6oAPbIBpZ1iByMAGS67D6DocmkBQk35loNfoguJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9wQKMAe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9wQKMAe"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so852253f8f.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345074; x=1792949874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TAyez3cZY/cfcBUVOfh8Pzy9eS6VTbnlHOSBTEpubGU=;
        b=k9wQKMAeKv+aqPmG8NSpafglxyjkzC6butuzlsYIRLnBcCmhnjmGt8EM6m0VeXHoZe
         HwKRxtV57e1TZENu5OHPGA046SQnvzllFNgYUlr+qvejhKIHWZIuSU8A861AR34ChJTc
         IgEfTnBOyg+zrcGII5FWkuIWcQulBHHQkjGlC7h9dnEnjcBG4ueaEUvtv6Velt4OIs9r
         Iks6gx+ddrAkmEjaPewZZA386KSGE7jR378dV/iaTq65XodhUEzRLKzbjaaOIOlOTyFL
         zNW+/6/R4pqUg+o2BMDe1cYReO/B6NHDcfa/ar2jTm64+yWVU8eA27OxoENgybKnjzM1
         1RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345074; x=1792949874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAyez3cZY/cfcBUVOfh8Pzy9eS6VTbnlHOSBTEpubGU=;
        b=Sa/e/yHAVMPeo+Bzrm3gSlXw2N1DuWSCj4gjFoQx3uX/pHrpopMdywBIYzzgUhEJOa
         HFxPU45AIzQs4OCJ9KeArISsBDQxz7ocPb28Hb6Pttr9X+J3FG1YY4Zez4druoWJAZpg
         jGP+ArotspWYfPFasXe5fyUi6yIVDt2mLSfmMRj2lulbDl3iuUvBLVXSYvkjBU5cHPDB
         xXMG1A3x0EfU6BU1aeyayj8rUXomuYlW7+ugU3DnHQX+oaapC1eBuEChME7fhJ7cQLm6
         562IpNOwDJdJB1GsRJGDhkya8VcEQb/NVSzSelWnIzNylz6NNPrGU0fMmx9ax+pjlw7j
         3aKw==
X-Gm-Message-State: AFq9FYI6p2F78eUpeT4mi8b/NZfMvouGStFUtmuDL0j9QoE+Ie1hdH8c
	KmtYt8dpGT4g8mDjkfh+P2P0YGdG4qKW3HYEP7+scAA1fyR7h11w3LEd
X-Gm-Gg: AYBFou2CwD9K7xfT2SSPsf4Nxdik+muOpF0anemDdhjfst4ryNLct/oqmE94RE7dYlR
	QdUW8jALbf7VkwTvMn3kl96cKRGCeFCGNrSwxoJnZwuPzyg7klCPRD8UNKrlo/5RnRH3Zk+7yyW
	oARqQSskWa1A49yTaODg22JLU9TCYDiTgkd2nA1Y0QQcMhuvwBsgEmZVhnWovjIwuJAt8i92G1O
	Fm0xKRsUzUuL4r03m/5F2CzROrLVMh1P7rXqzsfoTEo2NLn77C9R5LvXXk8PqWWTM+CjpEy5tK/
	VntFSfARuNl4v1kV5Hqp3x1xqKm2z6wjtJ6r28ez5wspjln17EC2GmuVd4MajWmxENh9Jh13fnc
	yvyG8jm0mx1J8Mn2vj8otyMc4xXi5NnbUrjiyAOQdzJysE7OTJ2p1JJLhG1HEGA30cS6V+sTV63
	L/wSFhKAHDxsL7VhIdwKm8U57hGQZ4ObvX01Opb+XSgb3Sl089QKzymThL0G10Wjqt4TWLmR7Ll
	CASLf4P1qrZ5lgaXnGGSjA=
X-Received: by 2002:a05:6000:29ca:b0:48e:a9:9e2e with SMTP id ffacd0b85a97d-48e07bb315cmr7398964f8f.14.1792345074245;
        Sun, 18 Oct 2026 10:37:54 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm19709297f8f.4.2026.10.18.10.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:54 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Rao Shoaib <rao.shoaib@oracle.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v2 22/24] man/man7/unix.7: Remove mentions of unsupported out-of-band messaging
Date: Sun, 18 Oct 2026 19:37:10 +0200
Message-ID: <20261018173712.27670-23-gnoack3000@gmail.com>
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

Limited support for MSG_OOB was added in linux.git 314001f0bf92
(2021-08-04; "af_unix: Add OOB support").

Its removal was discussed in [1] but has so far not happened.

The support is conditional on the CONFIG_AF_UNIX_OOB kconfig option,
so stating that it is supported would also be wrong.

Link: [1] <https://lore.kernel.org/all/20240409225209.58102-1-kuniyu@amazon.com/>
Cc: Rao Shoaib <rao.shoaib@oracle.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
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

