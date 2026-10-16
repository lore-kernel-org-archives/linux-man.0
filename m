Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEEE58E2D6
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171966; cv=none; b=UqdI8Qlj9M+5M7jYcaA4BRai5SII9FKmEHYjlCO7TGjIx6PhrTaIZxZwdf72+feYayAtDe9+abFGlqae0saUYaqXnPM+3S5ABXDJ2EXx9nvVBAzasO0Rol0NvZJ9ANCtJlJGdNJbsi2dWZzNT/8aNjGK2dFH6dhvHJ1GdDdzROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171966; c=relaxed/simple;
	bh=SFkPF3WjMwPORUnYnmG8lfCnioH/m56RhqBV3FYwe0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJQm1zynYGeO75LHjYXZrKroLVMxyhrwwfkYK2gL77ytl8hYGbopNrfAchnbbYRgYDWKyOBVsJClAoGenox7vUbTAV1oGwKX5fllsE6twnOH9oeR8Kj+R3wWbBjzDH2Wnm9G3KW3c+XFh+Z1oTlX2KdxLAgDS9yLmxFA4fWRbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDnrUnhF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDnrUnhF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so2115125e9.2
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171964; x=1792776764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CE0KDIUDAWj++AajHeg9EXfkv4+706wJrSsd8YgUDEg=;
        b=UDnrUnhFxmuqr6TGaxAVuq0BoIKn21f1cb6Dtwpv5eB7QbKwJf2KlN4ntWMkPfnQ9j
         qMSJcr85gHBbbSe7g/DdMop48B3Yzhj4UBjzr/M0AFp5gcgSDSBri/ysbjjhw5re3mNs
         PWRjuh+DxovlSz+5Hz8fl8OGAGV3/1uPM9qb6UEFsLV2Fa/lq2UfbZywpFvfq808yfcE
         j5dYuq+wrK7E2/g0DL6wytoQh67l7oegNkvYyt/US+Yo+TtRT8nArChTtz4TXQNp4TW5
         n9D9mRLY6FI6pE4dDVZTezs7/NDzlUutoZcXyv+1a7oyVWGevnPUaa3mHK92VhviqDNm
         FdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171964; x=1792776764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CE0KDIUDAWj++AajHeg9EXfkv4+706wJrSsd8YgUDEg=;
        b=nUvMfYSPqD1jc03b6a5UoSElClqyjupiJD428H02Yn520wUNbsM6dgfmsVrjjrtVqk
         iXaDFJz7xk7CChgGYfCHBPgWmUcjki9bUOvMkDo0SyBV5CIoJTgg942ZYUTtUUeJtgvf
         jmP2G8+qRFyvrTBDtAQg5IdIkRJtjMs7Z9Omb9NucRFGyPMwrXxjAV8o9OZJ8Mi0QfG1
         XXkB2auzfg256IX6nnWSA/rLtaeERhu1Xdx1DhGP1C+5EzQYa2P9zM5NNk+cS676xFA7
         o4xTcMLPLgbhzxuI4JHnVvVBf+VwJYO+xhLWdVgRx3bu0ysN3WrxO2Wev9HY+npuftHZ
         kPuw==
X-Gm-Message-State: AFq9FYIAJAjj8j9VtCl6KpAJSRLevyYTTncdaTGja00zGtNK5AW8Pmm4
	Q2bnfuJwFLfYCw/RYfUfCuqG/isS3mN4g6JURbyGgjiWpfenJI9lYDrQ
X-Gm-Gg: AYBFou3Xr60zVvkMUr11LcdQMzoqs4i6/vzaJYJ2RvWcXYmXKqFaePqQqS5e2Zh8JxA
	Qsqum+B7Fqcdj8oYl+1F5XAT/SBmJ7xhRorAIV7OelVb92gfEtP1X4367DBEgRBb4QeathV94nV
	Xb6DjXdkiFdVogfbm39UbTL/O+Mp8zt0ivn8bQ1Vokortt1RtmdWTcLffCgF7nVWplCk+7FrL0s
	YGDkJgWp+nB9fGOCnhZa8J28MNGm0eeyrOKrB+rpVZG17xnScOax+BEjxhA/KfmMvPmVQBR0/Lq
	ei+ZtyMoI2QiDl25AhnaMQS5T0n2AWe5l/pGUfjYBUN38DUaMYubksDIPUqfaehSO9Er33+gVzn
	cX6Caoez1hdx5IZh1jY8uTFm28G0Za1rPpt/Rf4s5lT5GIdEIOCBJgR+8jcZ0jjJmJHcZQMhVO6
	vzPPSy+appRuPD0Q6+C6s5SJ/x7MON8tpviXKJXsMISPtGh5BkNa3BM9qIXNiGEPuBD8sx2yozh
	LqTZ8rJpNipmb2JmmxIRcI=
X-Received: by 2002:a05:600c:6298:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a1d75ce285mr10490045e9.3.1792171963647;
        Fri, 16 Oct 2026 10:32:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm6021134f8f.58.2026.10.16.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:43 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 04/24] man/man7/sock_diag.7: Fix member order of struct unix_diag_vfs
Date: Fri, 16 Oct 2026 19:31:19 +0200
Message-ID: <20261016173139.13076-5-gnoack3000@gmail.com>
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

In the kernel's <linux/unix_diag.h>, udiag_vfs_ino comes before
udiag_vfs_dev, and it has been that way since the structure was added
in linux.git 5f7b0569460b ("unix_diag: Unix inode info NLA").  Both
members are __u32, so code written after the manual page would silently
mix up the inode and the device number.

Also reorder the member descriptions to match.

Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Compared against unix_diag.h header,
    where the struct field order is different.

 man/man7/sock_diag.7 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index d4e78c46cc8d..35a6d5a80ffc 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -180,8 +180,8 @@ structure:
 .in +4n
 .EX
 struct unix_diag_vfs {
-    __u32 udiag_vfs_dev;
     __u32 udiag_vfs_ino;
+    __u32 udiag_vfs_dev;
 };
 .EE
 .in
@@ -189,11 +189,11 @@ struct unix_diag_vfs {
 The fields of this structure are as follows:
 .RS
 .TP
-.I udiag_vfs_dev
-The device number of the corresponding on-disk socket inode.
-.TP
 .I udiag_vfs_ino
 The inode number of the corresponding on-disk socket inode.
+.TP
+.I udiag_vfs_dev
+The device number of the corresponding on-disk socket inode.
 .RE
 .TP
 .B UDIAG_SHOW_PEER
-- 
2.56.0

