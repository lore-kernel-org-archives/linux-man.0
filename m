Received: from mx1.buffet.re (mx1.buffet.re [51.83.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02923955FB
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.41.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632271; cv=none; b=EnHC7TzW8Yzh3oRzlQjxXK/PdQelBkD2sPau4gxWxEtYOOo5AVf3yD8CwfeHYEc/AtMCVVWV+VH61SbDQ2iFoyNf38Z+CgsTHMgXERVCLNg2K+unB2mCdWxYi08Rws+KbyidTmcp0NrOW8OmNYWdCYvHEEy36PsZFTDGoHXvB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632271; c=relaxed/simple;
	bh=xjB6/7jQxRdSVfM107u51S9vt9EAGLExL+sLnUiOPLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Utzqq2sZ7q3/Ph7J3EnlQheI9AXOspoUg2QbDcIwlKBD7f9BZ7I/Djp5Wcqsg1qsxDwvsYoqtfnHP3JJ2rAl4RitVmcwgwALVYNdZ257N6Yk3bEHmd0QwsYizJJur06RMUZ3RAWqqqrWenfYSgjMCUR7uU0So9z9R028ogExUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re; spf=pass smtp.mailfrom=buffet.re; dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b=UJtoFVqX; arc=none smtp.client-ip=51.83.41.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b="UJtoFVqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=buffet.re; s=mx1;
	t=1789631946; bh=xjB6/7jQxRdSVfM107u51S9vt9EAGLExL+sLnUiOPLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJtoFVqXk7w3tOgevmUKdLWxXSfQkDjPcEdQjCFpz2UJc4/r8VXP/dD/JBLhulNb2
	 XoJ7fH1IOfX3aaLJtvWM45wgDyi3gkniReZBU7BHeFJvjLmq4BgCBrfav8wY/5FltY
	 rJc9yaOU2wR1cyrPybKd3nG8Z2J/ydiGrqypNd7+u/oibmJPDA0xtfTYFMquG6esj3
	 Ak4W0OnixLGcEwiucYubHQ99/Yqe0KPZpOSjjq9H+gf1/lBF/fXARuJL2/5WLsrDnC
	 ZxXYk8i7aoX6nlI2vMcuwUoSD+MWwsu/qxJB9CxWoSvZ5f4inCaV9/a3qwHAyrr3AK
	 unsSsWuO9JkSQ==
Received: from localhost.localdomain (unknown [10.0.1.3])
	by mx1.buffet.re (Postfix) with ESMTPSA id 607C812684D;
	Thu, 17 Sep 2026 09:59:06 +0200 (CEST)
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH 2/3] man/man7/landlock.7: Document AF_UNSPEC behaviour and error codes
Date: Thu, 17 Sep 2026 09:58:51 +0200
Message-ID: <20260917075853.10231-3-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075853.10231-1-matthieu@buffet.re>
References: <20260917075853.10231-1-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current TCP documentation is missing a description of how AF_UNSPEC is
mapped (depending on operation and address contents) to AF_INET, and the
error codes synthesized by Landlock.

Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man7/landlock.7 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 880dd50582f3..51e63f40052c 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -276,6 +276,24 @@ Bind a TCP socket to a local port.
 .TP
 .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
 Connect an active TCP socket to a remote port.
+.P
+Note on
+.BR AF_UNSPEC :
+Calling
+.BR connect (2)
+with that address family
+can only dissolve existing associations,
+and as such is always allowed.
+Calling
+.BR bind (2)
+with that address family
+is treated the same way the network stack treats it:
+for IPv4 and
+.B INADDR_ANY
+it is treated as
+.BR AF_INET .
+All other uses of that address family result in the same error codes
+as when Landlock is not in use.
 .\"
 .SS Scope flags
 These flags enable isolating a sandboxed process from a set of IPC actions.
-- 
2.47.3

