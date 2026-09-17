Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513E4E5359
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675132; cv=none; b=CWdbsYEqKe5jXP7A4Apv/4V5WaW3Yeq8DnXxLRNNEGV6a5XE7tN0GOxBSaBkOPCkdk9btHvpy2Zl4qZ+cwXowqBXGbgzwh9lXl7zhWoMKZc3wAYHWyFzJs1Wjq7O2X4NqTTBMshdVDBrhNmcYAYhrNwsVkxJJ6Tmjg2C79g2iz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675132; c=relaxed/simple;
	bh=83VT85MGiion+q7sumZitzwYdjQYO7LC6t0R14D6olw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8IN5AV7zH+Q1uTV4ENrYTubb1VUAhUO6xeAVOniAHz2K/FJ2TkqnwuiDvHY9gvlj5JDpgVwhIoeWc4QdwYFl/9dq0/wTAaKlw0M5PatYdbcbW7b+zjs/f8Wa34RaDaa6agT8mtP94d9AZQj/XOgCaNaHn5OS+spr15prkyX0cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=lavrSK5l; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="lavrSK5l"
From: astian <astian@memeware.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789675127; bh=83VT85MGiion+q7sumZitzwYdjQYO7LC6t0R14D6olw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lavrSK5ltRMUdkizagoBmalUk65+QFxIPWvKEG+8KQbfxsE1TpkwwTxEmhKxCtpU1
	 oEhjJPR2YuG1IgfBrzV2QVH32cETOFKGQry2QLyvWWLqV6kVnSqKWagRRjP1N3UBlg
	 Czhwuc1oR9q4wve3DYgWE51fgbiR9rM/rEpvo+aEG/WR3kOASdbZ6i2uamHgKyK8la
	 gkV7SyNfbkaGH1/XwNXmXkocwOJy+PnqmOKapQ5G73PgAilOwQE/lZVQ6Y9gKv4NqM
	 LO1Fg+QwLGwRRIlf+Q3BDXSxzAPi71Qh5tRw/7qGpYe8htFGeAr91/UPVS0uyLiSTe
	 TQfa/3GJZ5EyQ==
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man <linux-man@vger.kernel.org>,
	astian <astian@memeware.net>
Subject: [PATCH] man/man5/proc_ioports.5: wfix
Date: Thu, 17 Sep 2026 19:58:16 +0000
Message-ID: <20260917195829.1380868-1-astian@memeware.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqvVeSW_dHnYbwca@devuan>
References: <aqvVeSW_dHnYbwca@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: astian <astian@memeware.net>
---
 man/man5/proc_ioports.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man5/proc_ioports.5 b/man/man5/proc_ioports.5
index 10d03f5aae7a..54854755c0a3 100644
--- a/man/man5/proc_ioports.5
+++ b/man/man5/proc_ioports.5
@@ -10,7 +10,7 @@ .SH NAME
 .SH DESCRIPTION
 .TP
 .I /proc/ioports
-This is a list of currently registered Input-Output port regions that
+This is a list of currently registered Input/Output port regions that
 are in use.
 .SH SEE ALSO
 .BR proc (5)
-- 
2.55.0

