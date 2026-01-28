Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28DD28AAEE
	for <linux-man@vger.kernel.org>; Wed, 28 Jan 2026 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626546; cv=none; b=iLcQh/rL3W4FInRIkdE3vA2yLbgXjRU4t+qmw5PUXw72L96Zaoax8b0K/iGV3z8SvKaxEG2X5rgpfkVGqyPCYfIDLm/MnUUBdFGpA+ys/ZwzgxNeiyhxMEvWcyNrtvHfxFGPKX4ng0eTZRXvizwPbUn/T4tSYp9DtvDvChpehGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626546; c=relaxed/simple;
	bh=ozSy1tCZj5F1wL6cpOrtD5Ilnngdr/A7BWHPmJm07CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFL7qBllajxKlT9tA4cocCGk+/9APK2JqUEhZDzy8QhcQWHYBWpbQkKinF+WRbkxf1U9lEMDBZN4wR7v7tYOs7k2U4EM+NpW4p6910tYJQoMk3w1IE1Ld7GIbAm9/j3OWIZ5c6lcbpYFQY3mSJPc2gCDDh2NLil3Ew1NsqjPtJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYgexnNp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYgexnNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B86C4CEF1;
	Wed, 28 Jan 2026 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626546;
	bh=ozSy1tCZj5F1wL6cpOrtD5Ilnngdr/A7BWHPmJm07CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYgexnNpIr7UxlVr63j5ABgH6VNlDJeghsQOXi4ZSZAbNeCQ5/pxOh8yNDjBoHjvh
	 kCaTw1TlfCPaqIFUdnahQtmKBKYxBIhaCbByDCgLTi1+GntXbN/DMvjX+7u17OjmN1
	 ANQHIeq3hptnZo6RizFyMqLvxIPGtRK4PC5s70B0OWCi30d93AQl6NnkZGz6qCAear
	 kQg32p2cUi3q5Sreg9XS7LpZAZpXqhugxUdUnJMtWsMqohPtW0i5AfZ3fE09Wgw4GB
	 X8JVXym2hA7lqCDRDgXtx0PhGSYQ13uqK7DdQlcJH39TxXG40F06FBRLiRfsd0EqE3
	 +ErRyemvuB2VA==
Date: Wed, 28 Jan 2026 19:55:43 +0100
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Seth McDonald <sethmcmail@pm.me>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, "G. Branden Robinson" <branden@debian.org>, 
	=?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: [PATCH v2] src/bin/mansectf, man/man1/mansectf.1: Add program and
 manual page
Message-ID: <c5da437ce6c8a41c4e5c26ee969170254b49dcab.1769626502.git.alx@kernel.org>
X-Mailer: git-send-email 2.51.0
References: <cover.1769497513.git.sethmcmail@pm.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1769497513.git.sethmcmail@pm.me>

Reported-by: Seth McDonald <sethmcmail@pm.me>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Cc: "G. Branden Robinson" <branden@debian.org>
Cc: наб <nabijaczleweli@nabijaczleweli.xyz>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man1/mansectf.1 | 56 +++++++++++++++++++++++++++++++++++++++++++++
 src/bin/mansectf    |  9 ++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 man/man1/mansectf.1
 create mode 100755 src/bin/mansectf

diff --git a/man/man1/mansectf.1 b/man/man1/mansectf.1
new file mode 100644
index 000000000..09f0a9fba
--- /dev/null
+++ b/man/man1/mansectf.1
@@ -0,0 +1,56 @@
+.\" Copyright, the authors of the Linux man-pages project
+.\"
+.\" SPDX-License-Identifier: Linux-man-pages-copyleft
+.\"
+.TH mansectf 1 (date) "Linux man-pages (unreleased)"
+.SH NAME
+mansectf
+\-
+format specific sections of manual pages
+.SH SYNOPSIS
+.SY mansectf
+.I section
+.RI [ file \~.\|.\|.]
+.YS
+.SH DESCRIPTION
+The
+.B mansectf
+command formats specific sections of manual-page files.
+.SH PARAMETERS
+See
+.BR mansect (1).
+.SH ENVIRONMENT
+See
+.BR man (1).
+.SH EXAMPLES
+.EX
+.RB $\~ "man \-w strtol strtoul | xargs mansectf \[aq]NAME|SEE ALSO\[aq] | cat";
+strtol(3)           Library Functions Manual          strtol(3)
+\&
+NAME
+     strtol, strtoll, strtoq - convert a string to a long inte‐
+     ger
+\&
+SEE ALSO
+     atof(3),  atoi(3),  atol(3), strtod(3), strtoimax(3), str‐
+     toul(3)
+\&
+Linux man‐pages 6.16       2025‐12‐01                 strtol(3)
+───────────────────────────────────────────────────────────────
+strtoul(3)          Library Functions Manual         strtoul(3)
+\&
+NAME
+     strtoul, strtoull, strtouq - convert a string  to  an  un‐
+     signed long integer
+\&
+SEE ALSO
+     a64l(3),  atof(3), atoi(3), atol(3), strtod(3), strtol(3),
+     strtoumax(3)
+\&
+Linux man‐pages 6.16       2025‐09‐21                strtoul(3)
+.EE
+.SH SEE ALSO
+.BR lexgrog (1),
+.BR groff (1),
+.BR pcre2grep (1),
+.BR mandb (8)
diff --git a/src/bin/mansectf b/src/bin/mansectf
new file mode 100755
index 000000000..a80f90b06
--- /dev/null
+++ b/src/bin/mansectf
@@ -0,0 +1,9 @@
+#!/bin/bash
+#
+# Copyright, the authors of the Linux man-pages project
+# SPDX-License-Identifier: GPL-3.0-or-later
+
+set -Eefuo pipefail;
+
+mansect "$@" \
+| man /dev/stdin;

Range-diff against v1:
-:  --------- > 1:  c5da437ce src/bin/mansectf, man/man1/mansectf.1: Add program and manual page

base-commit: 6754bd1a126ed1e9b7d9c2bc1d221681f5182bb3
-- 
2.51.0

