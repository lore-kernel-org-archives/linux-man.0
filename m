Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4E288B0
	for <linux-man@vger.kernel.org>; Wed,  7 Feb 2024 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.83.234.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707301514; cv=none; b=u7feO09RrWzLLmA9u1wE7Lh51sW6W3zwIv9a2HMT+mP5WDlut/QuZ4yzWQi5Gkl9lPfn0iaKX0C3PUx61teoOtLRZCRIjovK+3Fehvs7EbzUw9pHJ7mgB70YKvxtXmiKhltxgZq939CatxB6Qr72bxCiYRtMD79Toj2w/Iwfhjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707301514; c=relaxed/simple;
	bh=55VRAwG8YenbUW9rT7+Q1rt+lbJqwJlst4/ieelRjcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TqImXL74N73pK/y9zPZ+wYOC8b0BruCygcDbUqH0eGEQ1th/8zEfihLM1f6NQDpCZc6htCkSQrSHQ0oVn1Hslu6zs6SaajIgcDJ57ISS8U+Ms2az99+0N6HUenzvOH92h58O0IrapALiLwlKC81f5dg+63HItiU47oEtGAUJF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klomp.org; spf=pass smtp.mailfrom=klomp.org; arc=none smtp.client-ip=45.83.234.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klomp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klomp.org
Received: from r6.localdomain (82-217-174-174.cable.dynamic.v4.ziggo.nl [82.217.174.174])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gnu.wildebeest.org (Postfix) with ESMTPSA id CC0E4306A5A5;
	Wed,  7 Feb 2024 11:17:12 +0100 (CET)
Received: by r6.localdomain (Postfix, from userid 1000)
	id 15327340436; Wed,  7 Feb 2024 11:17:12 +0100 (CET)
From: Mark Wielaard <mark@klomp.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Mark Wielaard <mark@klomp.org>,
	=?UTF-8?q?Alexandra=20H=C3=A1jkov=C3=A1?= <ahajkova@redhat.com>
Subject: [PATCH] close_range.2: Add _GNU_SOURCE and unistd.h to SYNOPSIS
Date: Wed,  7 Feb 2024 11:17:06 +0100
Message-ID: <20240207101706.224655-1-mark@klomp.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO

close_range is defined in unistd.h when _GNU_SOURCE is defined.
The linux/close_range.h include file only defines the (linux specific)
flags constants.

Reported-by: Alexandra Hájková <ahajkova@redhat.com>
Signed-off-by: Mark Wielaard <mark@klomp.org>
---
 man2/close_range.2 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man2/close_range.2 b/man2/close_range.2
index 380a47365..fd13ba645 100644
--- a/man2/close_range.2
+++ b/man2/close_range.2
@@ -11,7 +11,10 @@ Standard C library
 .RI ( libc ", " \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <linux/close_range.h>
+.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
+.B #include <unistd.h>
+.P
+.BR "#include <linux/close_range.h>" "  /* For the flags constants */"
 .P
 .BI "int close_range(unsigned int " first ", unsigned int " last ,
 .BI "                unsigned int " flags );
-- 
2.43.0

