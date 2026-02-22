Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40078F26
	for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771771919; cv=none; b=ZAs6f0Xvp3jRkItsYqAKuvCQFaoqrR6+5KiS+wo6Ogqh32RJ8b4mqe0C62MSnyNqZeXezISriS3HgE9/69l8uWDPT53pTZbrHn1XUzfCWt5Xz7x/8puoEC05vUd97hM6ucBXKbHxIXbBZYoputjmYJWHEvtOdXtP61Wfez5XTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771771919; c=relaxed/simple;
	bh=qxOa/+ySLuZsrDUoMa2DY158V+RStp1V8CHvuC+P20g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1VHeWV2tQLcPVfhmDwpBVUVddRuE6h1oZcXTOUeCq/7DMSntX9KlNoFlyoeOvqZDg/RNo5rY+IJCgyGKy9k/jM+aFMNmtGF62enddhTLw4145CQs/3KIkLFgvqa6fDkEA0vC2j3AWRXxZyPzye+Q/9Gc9M/oBFSbRwDwULRdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6dnUwsz; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6dnUwsz"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2ad21f437eeso24720185ad.0
        for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771771918; x=1772376718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9kYC+tuAt7H0aOBGL2dyMpGPo/taxpQ6rquH0gbvpg=;
        b=I6dnUwszl0BE7qSW44p79V9JK2/e1clzV0+5Tn84Wdy0XfWgYhFDnENnfxnljIFBxz
         ek/GpVc+SH9Na2oIuugHLkUOD7HxIaLcNCutOwk3aRu9SKFEjUz7PebFG4+WKTZ5BFW1
         6yE8jeSIIjtBdGva2kbTyoLoh0E2o1iSMYyr2Mmjw5Lzl+Pznn1tBiOOpBVGX50dfSs0
         3mxRLJ2H9VkWScP2ZTDyuiCZXGHFcdFnVsFyeIqNt4E8vDlim/DhFu5RJBgIl/TnfZNk
         Ir6pHjVZ7yqMH6LT+Hww+0ORwKLNgZ1wJ7ZiZpxfcm7aJygApdT64BIiLUgtnYdj3WM6
         EuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771771918; x=1772376718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9kYC+tuAt7H0aOBGL2dyMpGPo/taxpQ6rquH0gbvpg=;
        b=xGwESWshHlB9/VSohPAH/k80nATHVKsmSZnC94nS9arig1vskJFevX3SYilUsT1jdr
         F5Pu23h93+dsm91bvM5gYNMTW9gmZ2PxoefkOC6DJWqN6lVYr8AMRaWEHDWRnvUWTUka
         g4vI5gZwBy1u2aG+vA+Ws3o5Juvi0Ce62K8v9KBXj9L4r/KDmIXJsFZF5lFFhZkcnOwZ
         oKav3jke3OLo3uQujW4C22B6PnXI9rl5jUGMoRYg83/VgUqRfQClazuFZcEisEJFoXW/
         COroSEwXv5vo3Aa1G8lcEuC3D8wgt43hHh5v4T/X1FCMNXM1kwqYyu5YxQFV/B7ehaHJ
         FxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUtsiL7Z6C8PyfDQFuLTUE58NJ9STlLyf2rke3Iua/oBDv6lkuqv17iVsoQJN3g7sAVkg6AO3XjHXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkY35U3IWKVH+75HVcuPHY7SB/RLB6W0U6ai/3BCkO8mxsj6J
	VnRRJzGsxZMIxPHbex5p2VGNvdrfFiCcDcXn1sOZTlGtOyb5AKYtgAY7
X-Gm-Gg: AZuq6aIA/ItbyJiwzltTJcP+OwQVxs9DrUoFnSK6YDTNTwHys8RNCRxP4J/cj2qSHny
	s8mZo5T9/noRsIyW4UdA4G6HWznjgvRPmwF+ccTA7sWsk1atuonjx9zxlRsLK7HZxMvxcmHmQi+
	O8HuvCOORQXe2RAiBCNiByW1oHr341BUu/05xIw4amQm8h8vpO7uZHuD+y4iu33wp6KxUJ5e1X9
	Vl9W4gGocHMJELkXLs7P7TCbofdr+yyNRR5yif823AZwGjHP3D1Z8JnG6CeM/B4aOrnRVmjbQpQ
	9RJ6RV4hXpKnbWFT1HaUe6XEaz3W1uMzn3qVO1ECEJgLLm+32n+CslssYvfBGTG9t/ZBJ6VN+AU
	Fn2nP9obEjLWbmnHmyd8RxHvHbd3xuaHRCBE4dvZVod5QWBFXfV+wrZX8xCiGtBEQm1R998rKhZ
	OuP4Z+541zmWG0usj56ndbjkKGJDTxPS1x0I+IdC5wmlK6leMpgk22iA8=
X-Received: by 2002:a17:902:d48c:b0:2aa:f5b4:9a2e with SMTP id d9443c01a7336-2ad5f7349eemr123993805ad.11.1771771918037;
        Sun, 22 Feb 2026 06:51:58 -0800 (PST)
Received: from fedora ([2405:201:3017:184:52f5:ed80:f874:1efc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e02asm45355415ad.56.2026.02.22.06.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 06:51:57 -0800 (PST)
From: Bhavik Sachdev <b.sachdev1904@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-man@vger.kernel.org,
	criu@lists.linux.dev,
	Andrei Vagin <avagin@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Jeff Layton <jlayton@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Josef Bacik <josef@toxicpanda.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v2 04/10] man/man2/statmount.2: Document STATMOUNT_SB_SOURCE
Date: Sun, 22 Feb 2026 20:15:54 +0530
Message-ID: <569933a8b526b89d35e84d5f0af42c7a4711b97f.1771771560.git.b.sachdev1904@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771771560.git.b.sachdev1904@gmail.com>
References: <cover.1771771560.git.b.sachdev1904@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document STATMOUNT_SB_SOURCE flag and the corresponding field introduced
by it. This text is based on this commit message [1].

Link [1]:
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=44010543fc8bedad172aa5b6c43480e5d2124497>

Signed-off-by: Bhavik Sachdev <b.sachdev1904@gmail.com>
---
 man/man2/statmount.2 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man/man2/statmount.2 b/man/man2/statmount.2
index 29080246b..f7a2feff9 100644
--- a/man/man2/statmount.2
+++ b/man/man2/statmount.2
@@ -51,6 +51,7 @@ .SH SYNOPSIS
 .B "    __u32  mnt_point;"
 .B "    __u64  mnt_ns_id;"
 .B "    __u32  fs_subtype;"
+.B "    __u32  sb_source;"
 .B "    char   str[];"
 .B };
 .EE
@@ -112,6 +113,7 @@ .SS The mnt_id_req structure
 STATMOUNT_MNT_NS_ID	/* Want/got mnt_ns_id */
 STATMOUNT_MNT_OPTS	/* Want/got mnt_opts */
 STATMOUNT_FS_SUBTYPE	/* Want/got fs_subtype */
+STATMOUNT_SB_SOURCE	/* Want/got sb_source */
 .TE
 .in
 .P
@@ -268,6 +270,12 @@ .SS The returned information
 buffer that contains the string representation of the file system subtype.
 This is particularly useful for disambiguating FUSE mounts.
 It is a null-terminated string.
+.TP
+.IR smbuf.sb_source " (since Linux 6.13)"
+The offset to the location in the
+.I smbuf.str
+that contains the source of the mount.
+It is a null-terminated string.
 .SH RETURN VALUE
 On success, zero is returned.
 On error, \-1 is returned, and
-- 
2.53.0

