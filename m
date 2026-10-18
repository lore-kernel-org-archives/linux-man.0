Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080A37DAAE
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345045; cv=none; b=ThI4Fyn9MzzieR2Smooj1ggaAV1ts7c4ij6V0mGmkHjSF0tmYJYCP4YxD2m428fG8AZUFPqX31MkwVxYNH1ums0/00hJJ6qmSzctnfYsUIajn5dWmRBKc2IgcYm0TSa8PdNwiBwvlcu3Wj9ZlhEYtFFUX6aXzh5bwIp+7c/wlAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345045; c=relaxed/simple;
	bh=U35Bv2HMjaR5/7/OgACgqaFjSJl567RNG4JyGDsrHAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGNJ9xpU7HaGkygs71U+0kWEQX16MgGGtuC+y0dOHm40pMqibD2Pm3YI/9/s5NDcPP880nZBM95ufA/orUsneY+jS0t5ZSLPEzDxDmlRnmG9w4lG40uniuV5fVcWd/auebT8LMwgyNoZhhakGkWAL+U/H68PotM1392JK6eU5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLqTxaIR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLqTxaIR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso4856225e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345043; x=1792949843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNA3qYHoSE4PjmmroKLi9f6ed3rP2rujCwrGtFcJ8vU=;
        b=pLqTxaIR0GgldTDLoVfJcOTAUg2RXQsq8gjSyUur0ponsGg/XUo32GDXKPZABwR1Om
         JZB70VyNDwSSENDjDU90YWIsULh2izv9e7eJ1appvxJ+TzPjnqJGCDB1shbb8vRi/NyZ
         6tI+9HA8s2xisC+/wRRzPp+9gQHp+tl3wmTf9P4IhuJddyxzZiH2x/UvnCKyw6D9Cl9+
         JsaGqVR/w7Tjdnzgyw0TK6Z7iJA/MPSXPchKeCY0JwO/C/B8DTGtHYLyFAsut2IPBrk5
         PYslIq68CVQRd62a2WGhYpJwKu9gs7oeshpKPPyugxMZUC1+ZFeSDFB+vWqmneC05F4A
         ZuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345043; x=1792949843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNA3qYHoSE4PjmmroKLi9f6ed3rP2rujCwrGtFcJ8vU=;
        b=YYqcJLFPWYqK26KBS07zM8YrVoVyrINJ9qGIoGX9b3vM0/LK2mQxFr1QPQgVSbTpDr
         Qgx0TFw8IHCQN860gu4YaPT9w3PC9tQUWThA83UC0TNsK56YYcZtM9qd2jFbEC387l9f
         9u4LTh0vy4Ds2k27NBXxVUwOKfCwhYVqI61CSW6Ub/bfUrwrxTUapPVntEK8z9X6NNXY
         tCaqQ3XQPRCqGPt4OOnknrgADrqmv9+zo+w4bpzvCQKNRIH9YhcHriSe0j5MTQXzV7I2
         ZgKi74miHMMBBsATlWb2SHTv3V3eFKV7tzmuZsLqG3njPwGgJUjhd1aioqUa2GaI3RNq
         pnWA==
X-Gm-Message-State: AFq9FYL1ATcoH8DCviBkzXzgomBPvvs4hkx1o2IZg6XWVSMs68LUWwxA
	UvqRUm+xNKV51IZUBsJt5GA+uwd/ir1jpcB/u6wApQUa0G1EtHAf0qvXGNu0/Qch
X-Gm-Gg: AYBFou0X5qgfgzC0QiScXkm1hIA8ouRmZRuT4+yuj5sbV3Y9W7HM6C+mL68wOch3ce/
	IdAwjQ/ZWeZTMpsCGNVs29rL9l4QfwlSRx97ZnmBS8yLwjuS1Klhv53b83hxeuUnsTZo5D6JpuU
	vKb/ht9HJ9/9tv6+HdZhEZqWS/+ws2Ta2Wem2a0fw6nxufREaSMEjj3m3srLp1M/TQ5YckSAHAC
	C6KjWYrhneU8fvD5TUXSRhZZpcgf8GqTrKvT18/tssuMX1ZQ65oQXZVAxgFIV433K8D8YPK0r9A
	4z2ygB2co0c8QLvoXNfWmMYxhH21MSYj7KT2tn1G7m5HPUH/wEufVDkASDpi584YZpIaAvIuCEH
	iKsxW4eu5n6TO6FgAn2joCDnv5qqiuVmi2/PagWYuLKGPmsqLuPZ7gbH+Sbw1TNB6KT+UMw2hmm
	Fzve0IA7kDk1YB7xMngS8X5XE76pokR2UQwj0EbrasKtRzJVLB1gem8d90/1A7GTj2QCO3MNrfg
	9uv+stGD/HFAsp80+hHW34=
X-Received: by 2002:a05:600c:4e11:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a1d75e37fbmr108862185e9.8.1792345042754;
        Sun, 18 Oct 2026 10:37:22 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm19313821f8f.41.2026.10.18.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:22 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	"Dmitry V. Levin" <ldv@strace.io>,
	Pavel Emelyanov <xemul@virtuozzo.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 04/24] man/man7/sock_diag.7: Fix member order of struct unix_diag_vfs
Date: Sun, 18 Oct 2026 19:36:52 +0200
Message-ID: <20261018173712.27670-5-gnoack3000@gmail.com>
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

In the kernel's <linux/unix_diag.h>, udiag_vfs_ino comes before
udiag_vfs_dev, and it has been that way since the structure was added
in linux.git 5f7b0569460b (2011-12-16; "unix_diag: Unix inode info
NLA").  Both members are __u32, so code written after the manual page
would silently mix up the inode and the device number.

Also reorder the member descriptions to match.

Fixes: 4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Cc: Dmitry V. Levin <ldv@strace.io>
Cc: Pavel Emelyanov <xemul@virtuozzo.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
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

