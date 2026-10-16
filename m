Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7C58B6DE
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171955; cv=none; b=AgNcvKPdggkNA11kPI9qiugbOWqNgZrKnPU8yPYQNSqb7ZzmzeaVl8lvUmw5gsG6P7qi4XAfnY9DnH/6PZnupvsdteNyP5N3UsMrGxoiHCSiqUdLSsjR1MNyqiDtGOApkdHt8Y92kH2iG6AV5lVYO6MSwmO16aTiF2ULCczt3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171955; c=relaxed/simple;
	bh=//Cl/NzyX+1jMtdQxP31HGy3HkV9Qc38ms911GHKtV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=racwKPB/NoGBTO5SKBP+sVZOayjep9m8PwktqtSe0PAAdm6CrORB9SB7Js7uUVjvVgEji5g1dkMZ/NDIeewbkXcT6HJgJi09gymGg6YrFLQvcfA52nzCLKQBTr8PsZ5klbxy1TaH76ueKlMvqOPH+kvnqTrRyMigU8pNFWcSubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGodVePV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGodVePV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso68045f8f.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171952; x=1792776752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ewui84l5+z2t6qUmt4W+BVTe+EXiqqAOj9dG7GCRuog=;
        b=jGodVePVoZ1Zi8UDObaoe6UTzLpQMhRJe7uKv0jR23c4sLORRxc61bz67U3zYrpUov
         A5fzeevJiWdq/GpTS+7sOWc49KFg52u/YMtlgZOTcQ9K8dTciDSlnGvzfKQbL1kdXqcP
         o5xcpGj0OmgZVu7+PQTPikwjaMtTPyDeb+U/fgJlJxC61e4Auc18Sr5tkCgZZgwUGzAy
         vIDU0Msr/yDXdzX00n0cScEJXbuivh28/eLrIidcW0ruq57cyOu3ZJjxr7PyNR3h2c3Y
         S+5Qh9Enajz2hDea9hioKeCPTGzaaa7Wcv1L5Se+SYaRMyTglCKszS7jrqxWF9e7x3gu
         OlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171952; x=1792776752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ewui84l5+z2t6qUmt4W+BVTe+EXiqqAOj9dG7GCRuog=;
        b=x4MKQyhQyWyUdM/1qzjeXsXIv3yzTjKSAbPZIyQvronYkJNGTg1azk1yQBVPL4zwKt
         2KMB9SI9lOKYyjs1YPBB1Nltzf5dRCeX6Hvi9uMTy/bkhh8xFa19TmVMS18BcJnyU4ca
         9poRyHCzD9SuYQ1QqG+qxhNTYIdk7P1PozX2Cx//2uTjrvS37spZdZ6UHDv7LH/ya4eG
         PmPRvnh3hlvCs5bPdjTivYI7z6YMNUNPjUTUX/9x5yjrseNuG0sibV6HO/zXS2R8GZQh
         4HterSBt/56olfxYxSnNSVEA6k/MLPFcrdc7pmgp35LxrYlrGVEtGIyp0ILoYB/k5pgv
         bZGA==
X-Gm-Message-State: AFq9FYIityh8GlON+4QJ4z19T3rSq2JRbJyY//EKQdg3OBk4/51TRWXM
	aMQ/T2WImIDu26Y+Pzi+jpozvWjbhcdR22Te1CuvQ8RUVKgdPnxiqnQl
X-Gm-Gg: AYBFou1JgNvGS2c5lcR1iWEM1mneEUAcsyGnhMD5edY43+aZBWFHBDp9ozX8V+R4645
	Zr2jrjFxE/vI03mynA/ZCWws0uNBOIJ+c5L7Js/O174dPWm3rnU/daX1a07Z8XcU7V6kBZBsgCe
	DqF+W52OWT8iGgrXQrj3GjQHgamAnUZ4/JmgDXDLQadCg/LxXoojIoK7ZTOYu7i3Jt4bBQSKM/b
	91ZyPv8EKEziwMhOS50h1WEdxnwiixTyK5UMG/gUnlPmUF6SicbVXqw5yZUnikoEpH0Hix0wpqy
	+LyXulnAJJKMDo/Lyn8/7bKRZ1v7Qk757abZqSX4zDtyUpq2CPsBCG5slsRJ6LhWxLcqzG8HUh9
	Eqefi2UDeyShexK8X6X1OQisqGI2oNcUnjWEyxW16/RWArfqhrxjAegZM9+AeGGuIAN2713+ejJ
	0HehEQqG6ZxTdpmq9XKCKzGY79ztSmTvdFB1VLh5qHHevxVhOfMBQQF+90CcDMEKwhRztxlHgD2
	wu0duHe3H9fc8+Hs4F05Iw=
X-Received: by 2002:a05:6000:46dc:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e07bb58c2mr454311f8f.11.1792171951367;
        Fri, 16 Oct 2026 10:32:31 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm5484401f8f.3.2026.10.16.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 01/24] man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not sun_type
Date: Fri, 16 Oct 2026 19:31:16 +0200
Message-ID: <20261016173139.13076-2-gnoack3000@gmail.com>
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

struct sockaddr_un has no sun_type field; the address family is in
sun_family, as described in "Address format" above.  The check is done
by unix_validate_addr() in linux.git net/unix/af_unix.c.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Fixes an obvious typo

 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index f9db05a71d93..75e125c61673 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -663,7 +663,7 @@ Invalid argument passed.
 A common cause is that the value
 .B AF_UNIX
 was not specified in the
-.I sun_type
+.I sun_family
 field of passed addresses, or the socket was in an
 invalid state for the applied operation.
 .TP
-- 
2.56.0

