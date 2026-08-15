Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE5B757EA
	for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786779935; cv=none; b=HGrXfpJqtsgpmYMrY6gHIozweQxnJA8Eq/RfdOK9OZeI3BQ0gNbjQAQueS2K458/r8MGmAGzmzl6/4nFX8lJIRqfcPpmE9mvtlf1uQNMh0cZVY+k+LBjqBOR8khoZVo9Q0mkgDWU+fDlFNkhG6H8K610ZMG2tCau+cAcHZKpWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786779935; c=relaxed/simple;
	bh=GBDrWZwBJvsCOYDKQ20YSY0BRYq7skufz9Pwat3U/o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBvkZzQPD3MGEgPz3s5ELKW48FdJufwdK4sMZdnAtfCc8vh/JcOAYW425WZvjW0l6ArbHowe/iRAR605x07yy6SwaVYc+4VmEgqkOULqXUnNS6sAZuyI4OAN7ZrqVN1gTLQpLOMP8JTSlttbc3/XZt33LjRnJu2eULp7S1MFo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJGnbf6T; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJGnbf6T"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1070144a12.2
        for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786779933; x=1787384733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XX3gLh88fbVp1PfjkYHnhhT2U6w+Mwz0HWk93q7N9lg=;
        b=LJGnbf6TL5yYuVFRRXj7viUVcp38eSUYg+kbQMLXGF2StRqJLylH+/RsGUIuHXBVjX
         OBA1fYSs1I9Ni6HOdnJsHNy74olz1qpivjSjYCvs/cU2OxNh/caLA/iLF9Ny1m57IHEk
         V0o1K/J2nOP9xP9ZeYQbDCT7zFpNIJbALh2IXMQrkukIF2X7NIi+j75QSvYvcuhl8oZR
         w6JqD4YdbJpeJNrv++MtSr4JeUzfB3Ah98NfsHaSVEqCkzpdJtw4cTFcxEJ0aNfxZAHY
         p2Lwlp4jYo9A20O/DUneAFzGgoOb8W8un8VSM2EHh/KuCoEqgrC49JxWWe65ziuIm5h2
         M4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786779933; x=1787384733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XX3gLh88fbVp1PfjkYHnhhT2U6w+Mwz0HWk93q7N9lg=;
        b=J0+1kOere2aGAOy8qKsJmq5DtAS/Up7zTzcnlUhYIAvM4WLivl+1QeFU+1IO8U7EqO
         fdjow9ZH9cqBDWzGaCRbRtWxXPJWR9Vg0ZnZ+NbeuznCo2AKS5nQR5d7xiZAW9gCrnfN
         WfOBS/LLOT9kQAq4IP2jntKwVQ6AVeSzalNMsmo+Abc78nP7Um4NRd+I3T2XsXlDe+qe
         lrJHG2+iKvW7nDodP12D7wpq3AgBeNi+yppWdJe1GNy1d5RML6kVJvOnua6UTn8etQR1
         uh+hkgwD5UfU8JToHXoktJtEoYX7RoN2DjHhrIZ6mYR4oMLx2uYAhWrPyZjm9d9pnGca
         0VMA==
X-Gm-Message-State: AOJu0Yz3bfWb3e/GGFktZYld6HTpJUv7n09L/0QfJ7zOIU7aABNtxJI1
	ruF4nKcXg+I2iwPuhh8RrIX+3nIk27FuFB3kgQhRK0X1daxGKGyTReXW
X-Gm-Gg: AR+sD13EORsJ0dlAhcWlILaJJXf6azskRjghqy3You8nvYO5azVSsW6t0QPFzVGLV9d
	2tMeIOdLLUFQDvveQKaGWK9jabTUjWSSJfYZSrf2BmqEVJ/XLFtXcsmapHJHdPFTUaZoSeQqgt/
	67eD61EpS/k66PDK1Stknxm3V+H74SLpeIc65pgTVuz7xo3TfbXecn5OJH0/rL0uPOerXxgwZ/c
	BMvYuVAaY75c8dIru8Xu7NCgMZRGXOivy7Xj5v0RApOsUHMDLdqrXDkNn9UWyg5xQNaSBQcgB1O
	J+USGdcI/t2DR2QvTtgc8DogXcU25L3XMvZwCWJWSw7JZfBo3++E63QjOA72TkyE6OelDYpXWi5
	d7V783zMYls6QXSqoJCmpigLrvNb3WOBXS7iibrNjdwGHWm6z8CbeQgB1wvZbkNqwSoFGwY6+tZ
	a+rWEF99yO3BdXBZ4gGX7NiKQ4JVXNWjI4RN8K8yxGFcnue+06KIOMsfc+B4kJBdYz9Njfrj51E
	+vBCQS95AybgWUc7OFyEmLIQrBPcN/0K8gYx/56
X-Received: by 2002:a05:6a20:939f:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3cc71cef032mr14384081637.24.1786779933409;
        Sat, 15 Aug 2026 00:45:33 -0700 (PDT)
Received: from bsach ([2405:201:3017:c7:ee87:94ad:2898:e685])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm16071835c88.9.2026.08.15.00.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:45:32 -0700 (PDT)
From: Bhavik Sachdev <b.sachdev1904@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Bhavik Sachdev <b.sachdev1904@gmail.com>
Subject: [PATCH] man/man2/statmount.2: Fix incorrect function signature
Date: Sat, 15 Aug 2026 13:15:26 +0530
Message-ID: <20260815074526.1094308-1-b.sachdev1904@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flags argument is an unsigned int not an unsigned long [1].

[1]:
<https://github.com/torvalds/linux/blob/master/fs/namespace.c#L5961>

Fixes: c011cc992510 (2024-07-09; "statmount.2: Add page")
Signed-off-by: Bhavik Sachdev <b.sachdev1904@gmail.com>
---
 man/man2/statmount.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/statmount.2 b/man/man2/statmount.2
index b6d9dc2a1..a365002dd 100644
--- a/man/man2/statmount.2
+++ b/man/man2/statmount.2
@@ -16,7 +16,7 @@ Standard C library
 .P
 .BI "int syscall(SYS_statmount, struct mnt_id_req *" req ,
 .BI "            struct statmount *" smbuf ", size_t " bufsize ,
-.BI "            unsigned long " flags );
+.BI "            unsigned int " flags );
 .P
 .B #include <linux/mount.h>
 .fi
-- 
2.53.0

