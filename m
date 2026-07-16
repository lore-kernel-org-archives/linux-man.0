Received: from mail.runxiyu.org (runxiyu.org [155.138.132.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587139CD01
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.138.132.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193364; cv=none; b=HKlycfr7IabtxrsZIvmwAdgllj04/I3Hm4N8ngZ9imiXx1JvRJMVvv87f4Ms9nqQKtIycRoou1IBWPi/eOI1YRM6q/lyjIyMl2O+3JQxgXTtHyF0jIlxatngDtYQjWUhpTkPTKEDdQoo3LHkXvFOwbsXXqo6XHYUMxN3hJWsmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193364; c=relaxed/simple;
	bh=n+Yh7Z/iHJ7IniyqWmqx4xkK3V/TjrUiqU/Lww9bEms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRY1ulkrg4OJs2HECEjZlZGZ5X7kEIuSQksURbtxf+ZPkf1mHTL1/OuDZyeg04b51g7vBM+1st6ddDq/E+hd+mbmTzYhKlDbkoAy/4la7StST6MFuJJmglEmoL08/nzjwCKYcJq0Fl7vkLqvjM+UhGMQLxjgQFcP+qdEhGd7MRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=runxiyu.org; spf=pass smtp.mailfrom=runxiyu.org; dkim=pass (2048-bit key) header.d=runxiyu.org header.i=@runxiyu.org header.b=LQDHjZGC; arc=none smtp.client-ip=155.138.132.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=runxiyu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runxiyu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runxiyu.org header.i=@runxiyu.org header.b="LQDHjZGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=runxiyu.org; s=mail;
	t=1784192847; bh=n+Yh7Z/iHJ7IniyqWmqx4xkK3V/TjrUiqU/Lww9bEms=;
	h=From:To:Cc:Subject:Date:From;
	b=LQDHjZGC7pNSOrNteVwgeCLWAqx8URz6zEtlpnfFgNcjXwAtjUHjjI2wx5QJL2g4l
	 EPf7lEnGBajmB9paav/U5e1drNyf1wpB74NHuJwbphwv0a859YZ4r15whaE8IfbKw+
	 1sqvYxtMNxulyBZWsTxRwC0ulpD/wylP5MrkdbUPu2TeCEUbP2UpXXIY/QeStGw657
	 +cB3rUVi6rIGIPVrZRV5i9fHwL5xkKkNmeahjiby9ZpxQqCMipHmaK+cXORULT2T8X
	 aBs9IDBRCSM6LfBFzVROFv9GbJCsvkrXm80DtjitqgUAKUouBoY0tdhIVeZcizK/rM
	 3HfyKHylSDYmA==
From: Runxi Yu <me@runxiyu.org>
To: Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org
Cc: Runxi Yu <runxiyu@umich.edu>
Subject: [PATCH] man/man2/link.2: Document new AT_EMPTY_PATH behavior
Date: Thu, 16 Jul 2026 09:05:36 +0000
Message-ID: <20260716090602.16571-2-me@runxiyu.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Runxi Yu <runxiyu@umich.edu>

Signed-off-by: Runxi Yu <runxiyu@umich.edu>
---
I'm not on the list, so please place my address in the SMTP envelope
recipient.

 man/man2/link.2 | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/man/man2/link.2 b/man/man2/link.2
index effed3f74..a888da919 100644
--- a/man/man2/link.2
+++ b/man/man2/link.2
@@ -115,9 +115,30 @@ created with
 and without
 .B O_EXCL
 are an exception).
-The caller must have the
+.\" commit 42bd2af5950456d46fdaa91c3a8fb02e680f19f5
+Since Linux 6.10,
+no privilege is required to use this flag if the credentials under which
+.I olddirfd
+was opened match the caller's current credentials
+(as is normally the case when the caller opened
+.I olddirfd
+itself and has not since altered its credentials).
+Otherwise
+(for example, when
+.I olddirfd
+was received from another process,
+or the caller's credentials have changed since
+.I olddirfd
+was opened),
+the caller must have the
 .B CAP_DAC_READ_SEARCH
-capability in order to use this flag.
+capability in the user namespace of the credentials under which
+.I olddirfd
+was opened.
+Before Linux 6.10,
+the
+.B CAP_DAC_READ_SEARCH
+capability was required in all cases.
 This flag is Linux-specific;
 define
 .B _GNU_SOURCE
@@ -281,9 +302,10 @@ An invalid flag value was specified in
 .B AT_EMPTY_PATH
 was specified in
 .IR flags ,
-but the caller did not have the
-.B CAP_DAC_READ_SEARCH
-capability.
+but the caller lacked the privilege required to create the link;
+see the description of
+.B AT_EMPTY_PATH
+above.
 .TP
 .B ENOENT
 An attempt was made to link to the
-- 
2.55.0

