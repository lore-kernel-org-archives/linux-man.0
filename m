Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB64582BAC
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171999; cv=none; b=Abs67L9D7pRyqM7ufTUuFDBXXraKL9vT6dGi2eWRrENLl3q/tMfpzlkIDevYndpoKt0ot9iUyN7OmO7XlK2z/kQnA3w8QexrAZorSqsLfjHYGWd6SgIvMx4SVv7lFvhRH+DTXngv7T9iRULrYoKKOPlAjQd+DhUv7Jg9yv7UOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171999; c=relaxed/simple;
	bh=7jrtJnQwiEnB6BKNn7OkqHrKJ7USQlxI4QI5hbgBCsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vm80Z64TOhZwBeydhIrD2Z4J0oP7TBdccCOr1bHbMekstom0B1vJGKoL57c5rmsgVD1VV1U8k5PXLBjcs7/fifQHXrzVBF6+7nWFBuE5xZ6JQUvr9TaVm8twkzBEYqL+lk2TZBuhnLD27RuysUe6vp6gyKHF4X1w5becsjncYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnCvavuj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnCvavuj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so1560725e9.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171997; x=1792776797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGTeZsI009cn7zTT38gEjK+c2iYeizgxtaEEu6ZmQJc=;
        b=jnCvavujzfNtTlFUXnDVvwBiSv0eDp56z4Qwj7ppkEVPS2z4CiC9f5RbrXfGKIrIJp
         oa455RqiBnTBoYQtrV5xWKQjsZfX5nzGq6y48L7vZTOlqDTLVcIxBAMoLjI0CJEnSauO
         qYOn8gCy5Z7jxuAD+eV4EnIRBqXneF4GIi63acgD202HVw1pXGdnqh5s9cSvXB2+hHaL
         f5pH/3YsPgCXw6880lbwF3bvX2ixDKKnsyMCHS4lsCaJ/mKZiWu8eXilnKX/+GRGse7K
         ot+4TBdyuwzH5GxBsGkTq83AWbLMribjl37MuZjuqk3mpK4lco/KEOCz3Yn944M3OgsT
         iv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171997; x=1792776797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGTeZsI009cn7zTT38gEjK+c2iYeizgxtaEEu6ZmQJc=;
        b=2G1DICR5BUOBneA/AanoOnmd9y/7jteUv0wxdrrTk06NEuL6A+AGpAeqhO8NU43T6I
         rCfjvt//vKNP9C6xE1YdnZaFadlDo9AYL3W4E0P6+vV/kEVUStXxhjpQrV8rQiAo4dgw
         7WtfnsnaWRPgJyf1shKbl3DSWWf30KVAhQ8i1UZfP5Bf7reV373AbsOJ20S0u7OCStz0
         9ZkoaSPVEIIkPxDFUQNS/5vgFYsHrUA92DWc6FBt/7uuOLidN5DyaxlBnZDxDqI16xUX
         hg7araLsxuzyQW6Fn1jJfo9FDSpNznqn2kMenoXvX0ixANjm5ZjVp8fLmtg57D5f8S6u
         932Q==
X-Gm-Message-State: AFq9FYKpF9lSb3K9AT9TwrWf+I7ioHUFGV8c9Vfga2sZwHpJUBngD2li
	rtNhpNBlIt8WWfqvbM/IPnTYeu25SEpAE1UnceNgcI00Ke/KR6KAHjVUTTm59W55
X-Gm-Gg: AYBFou3B7gm5lkUAAgOYu7vH+MCtDxjADz4bY+FVYX3ccItlNTArus3/494KJVzrFcy
	CUTSyyueU3okUZVzKCTiv2ga3CiLT0jIMFYYG2W5m0i+nQcCO/gSseL0496GJwDr6UPStuGgpm8
	BtaYWhNssMM21mWjK6THlF/wSiqWay1ZWfO5bfz0MbZ60dLjmjPUnxgk0L/S6x0NNvcwvzqcGhz
	TTRYLUbzv//WGCAXnl2QsUCKbZB9GJTGV6WMoEK+m1w6AERxnIEejdTvD2QxeIllvJ+o+B0Ejvg
	U+hThGcr4p+g9mRRPHfjEITVsj5suzRedsUyh+pcMb9J+/CJjTkotW6MXYBSa+gCVWv+q1C0tOn
	XMuKzBKUGoYO2H6rMOrLaVlHJdwnp/wMjjGz9ReNfP32w6eBAYVDhpQb8KxKQdV8mWLnZyCmdn3
	kE+W2fNXdcNwK/uuIGTybZ/2WdjxvLdYAA8U0YJjJBV4NbEIJtiojYMVTqGU19Q9S7lRbg8x8IJ
	z+qSnJ2GSVqsczJXv/B6qQ=
X-Received: by 2002:a05:600c:b86:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a1d75f8b7cmr10739945e9.13.1792171996657;
        Fri, 16 Oct 2026 10:33:16 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm49734865e9.1.2026.10.16.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:16 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 15/24] man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is required
Date: Fri, 16 Oct 2026 19:31:30 +0200
Message-ID: <20261016173139.13076-16-gnoack3000@gmail.com>
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

In addition to the search permission, binding a named UNIX domain
socket requires write permission on the parent directory.  Bring the
wording in line with similar documentation for EACCES on other
syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
rename(2).

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Reworded commit message and made sure that wording is in-line with
    other man pages.

 man/man2/bind.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/bind.2 b/man/man2/bind.2
index ccb77e553cb2..6838a9d164aa 100644
--- a/man/man2/bind.2
+++ b/man/man2/bind.2
@@ -150,7 +150,9 @@ The following errors are specific to UNIX domain
 sockets:
 .TP
 .B EACCES
-Search permission is denied on a component of the path prefix.
+Write permission is denied on the directory
+in which the socket would be created,
+or search permission is denied on a component of the path prefix.
 (See also
 .BR path_resolution (7).)
 .TP
-- 
2.56.0

