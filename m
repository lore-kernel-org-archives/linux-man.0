Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9953876A0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345075; cv=none; b=Ax9pbxDQ/NvbviCTulS7j1QioRgYgGOrku/yDkg/O3DTky5K2uTuOobqnHpawEAV3LNCs/x5wdH6hxGXSH4yUFTvhIjvEbcv04GpcX3T2PfMgg9LccfgjCHvOhKHjT0DwJW083Bq4/3pPMhUqoRmMj0PRzmgh0PQVp6LsHDmFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345075; c=relaxed/simple;
	bh=63XVzORgwquECplTtRVQndQ7e0+VSOaZKUx2hNV+Wi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsUyLVabPcsljCacrUPXr2Sn64odHf49DWY2fU0J9rxh8rq8jmAX37iQqjQF1Ej/0E4w9fRe0C+WNGdTUcEM7uHqWY04A66aRy+SnV3bx1RaqMQ1Bf8cn4o74hUQSY3HvsW0q4zTrykgJJENEkXjWt5yRJDUM5we8G23CXqAAHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYk6wQ0W; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYk6wQ0W"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so650621f8f.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345073; x=1792949873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/NAs4UEQnBIr2HxH8q8R5oZC5JcrfxQIB5kFE6aIIE=;
        b=XYk6wQ0WHi3ntwPrCYMbwhWKsqSjKS48fkOpwTuLqveUhznP+dj4kWbrY8K9Jw4+hw
         nTzqzGUYhVMnR242yIiIlqg+FUgD9BgMzIPMSTBCx1IGmVNJGV4Le62p1tZGO7Kc3KtT
         KqzpkTdQHOnwkFOB0iJ3NI0qF/MBlvOaenTM7FVCvcvXe/KboIOnSI74lZrSOz5yiK0Q
         WLFMNw3dNL5zkQrOVh4a1pZr8f6yV5P5UzykIKmH4vkOweor5R3uTOb9VpCtdav7j7Qs
         UZb+gllNe6WD1/gsMe7uUfI0rj2IQvpJQAwhBjaPvt7JcMVlGm8dAEWWWlAMzhfANEMT
         SvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345073; x=1792949873;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/NAs4UEQnBIr2HxH8q8R5oZC5JcrfxQIB5kFE6aIIE=;
        b=CtXaaK8N7VXeJhxON2ZWj8GP6cIX3FRJn2MYzBBGu12rNinLAQMXOOZQbQcehNhzKN
         mrHm7/8ovMO2nLwMUAkEzLMo46s1ddXuz7+7itlid0sLLsbJzJlYiqwSsKRLsnsDZocz
         ksmxhba6PNtVL0Ly7nk/PhLhFh23yVLs/kvEzituW6bQTysz1wE304+U9/SVKZtORj6W
         qbuvLLe7sWEYfU+/KaEkHsEvu+O05v7EokI7jX1/D9gnebFFVK6ysdqpJ+ctuEdOK92r
         F/6fJ6Dqft2WaB8elFPdg7lBYzsvvEcPLBcGfMLtZ0AV/FnweGDlaJNxycGtO1El9aOQ
         YgcA==
X-Gm-Message-State: AFq9FYJ1BCblkKZwiKddzFwjJTMDfHOACaXptht/tPTKIJoMf2B6j7+O
	YOGCqo3AvJIZMWq6GGbIIkSlEEMEMuwAe2PLiNdqd0IFPSrHnC+3Yvs6IM6SWxRQ
X-Gm-Gg: AYBFou14DEZasxtvANFNTRyKCYqIcDo+HEhioD/KL5+KF1F//OPxkJVcLy2qmpPDyIM
	RCf9MhnYr4x9q39BI1ezruQ/5yimA8lTtlKTav5/jUgoXecy/p8culZhRjom1Ctjx1hxm6U29Qp
	Kir5BHgtOHHTyQUYq2nt0axAn14U5SULW9UOesRXgqC6smAL7D+JgfXPRKaIS5E5hmezbV5tsY3
	JweKkmtybaMNJ4cHRE4Z5KmUgW79v2vL5ReLyNklPz4gmVQhH98393pa/MO+C54Hvd4dDstsF0d
	pjQ91FNT4PVB+YhCjznAXuW0ecxheEok+rxSYGGn7QypPvB46VS0ndNdioAY9nf/gkZh835DzgT
	DNZLUa7gKZtqhAlIj+c2eDQF9tixg/0HsCh3KI2nRZp+/KnRFGJfUMNtty9Y60uxRAddkosW85W
	/yDo80WH0QrwNBWi/K9rSyRg9+jz02+/6k3e/0qi9isPfM5NDTOR7u5/n9VxBgorb2Er8KzK82p
	D+POEq3/MRPPV2EiUgh+SU=
X-Received: by 2002:adf:e19a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e07fa6ffamr11142619f8f.54.1792345072618;
        Sun, 18 Oct 2026 10:37:52 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50ae5esm19568721f8f.51.2026.10.18.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:52 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 21/24] man/man7/unix.7: Abstract sockets are scoped to a network namespace
Date: Sun, 18 Oct 2026 19:37:09 +0200
Message-ID: <20261018173712.27670-22-gnoack3000@gmail.com>
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

Point out that abstract Unix Domain Sockets are visible within the
current network namespace.

Abstract addresses are looked up in the per-network-namespace hash table
(unix_find_abstract() -> unix_find_socket_byname(net, ...) in linux.git
net/unix/af_unix.c), as network_namespaces(7) already mentions.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Verified in code

 man/man7/unix.7 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 47f09f16d024..8d1a53948f5b 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -262,6 +262,16 @@ has no effect on the accessibility of the socket.
 Abstract sockets automatically disappear when all open references
 to the socket are closed.
 .P
+Each network namespace has its own abstract socket namespace (see
+.BR network_namespaces (7)):
+a socket can connect or send to an abstract address
+only if the socket bound to that address
+is in the same network namespace.
+In contrast,
+pathname sockets are not confined to a network namespace;
+they can be reached from any network namespace
+in which the socket file is accessible.
+.P
 The abstract socket namespace is a nonportable Linux extension.
 .\"
 .SS Socket options
-- 
2.56.0

