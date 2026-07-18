Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74915271468
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389578; cv=none; b=r4ip9iDKIfyYVXZLM0/EefwO/WacvD7kWDwUQ+J8U7M6LzbWwXb759+XRzJqPMbUOc5wbBqwRFScN8rTXv30JxKYIyvRcvtNmUoumkpcxJRmXZIuKoiJ8UjhwPfeH8ojcwSOyMyDe6n8sHPql0+Wx99cr8BxPLzBUhmw+NY0VlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389578; c=relaxed/simple;
	bh=7NsrnCyoL289Ag407ZTrKYeyEDTzk/DnUnlFhC0HbfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sphp3gdcy2V9ycI8fvpy/QB2xWujUpf0uVNB/0XpxQP16+CK/506hB5z/HGeRmgFGZ65xgyYQhMBEZrbq8b9a4jEH2/52F4CMkii/gOHHYBMjprkCFmP3Nzr8HaeR6xWhqK1kIDGZeuqAYtOn0oLsw7UH5si0T2LK5gtuiHXa9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id 40EA8100388188; Sat, 18 Jul 2026 17:36:32 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id E44F91003A235F;
	Sat, 18 Jul 2026 17:36:31 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH] console_codes.4: document more xterm codes
Date: Sat, 18 Jul 2026 17:36:31 +0200
Message-ID: <20260718153631.55879-1-jengelh@inai.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man4/console_codes.4 | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index 10d2e3b5f..9507a760e 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -754,7 +754,30 @@ T}
 ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
 ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
 ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) to \f[I]txt\f[].
+ESC ] 5 ; 0 ; \f[I]txt\f[] ST	Set the color for bold substitution to \f[I]txt\f[].
+ESC ] 5 ; 1 ; \f[I]txt\f[] ST	Set the color for underline substitution to \f[I]txt\f[].
+ESC ] 5 ; 2 ; \f[I]txt\f[] ST	Set the color for blinking substitution to \f[I]txt\f[].
+ESC ] 5 ; 3 ; \f[I]txt\f[] ST	Set the color for reverse substitution to \f[I]txt\f[].
+ESC ] 5 ; 4 ; \f[I]txt\f[] ST	Set the color for italic substitution to \f[I]txt\f[].
+ESC ] 6 ; 0 ; \f[I]val\f[] ST	Toggle bold rendition: 0=bold, 1=substitute by color.
+ESC ] 6 ; 1 ; \f[I]val\f[] ST	Toggle underscore rendition: 0=underscore, 1=color.
+ESC ] 6 ; 2 ; \f[I]val\f[] ST	Toggle blinking rendition: 0=blinking, 1=color.
+ESC ] 6 ; 3 ; \f[I]val\f[] ST	Toggle reverse rendition: 0=reverse, 1=color.
+ESC ] 6 ; 4 ; \f[I]val\f[] ST	Toggle italic rendition: 0=italic, 1=color.
 ESC ] 10 ; \f[I]txt\f[] ST	Set the foreground text color to \f[I]txt\f[].
+ESC ] 11 ; \f[I]txt\f[] ST	Set the background color to \f[I]txt\f[].
+ESC ] 12 ; \f[I]txt\f[] ST	Set the text cursor color to \f[I]txt\f[].
+ESC ] 13 ; \f[I]txt\f[] ST	Set the mouse cursor foreground color to \f[I]txt\f[].
+ESC ] 14 ; \f[I]txt\f[] ST	Set the mouse cursor background color to \f[I]txt\f[].
+ESC ] 15 ; \f[I]txt\f[] ST	Set the Tektronix foreground color to \f[I]txt\f[].
+ESC ] 16 ; \f[I]txt\f[] ST	Set the Tektronix background color to \f[I]txt\f[].
+ESC ] 17 ; \f[I]txt\f[] ST	T{
+Set the background text color for highlighted (selected) text to \f[I]txt\f[].
+T}
+ESC ] 18 ; \f[I]txt\f[] ST	Set the Tektronix cursor color to \f[I]txt\f[].
+ESC ] 19 ; \f[I]txt\f[] ST	T{
+Set the foreground text color for highlighted (selected) text to \f[I]txt\f[].
+T}
 ESC ] 46 ; \f[I]name\f[] ST	T{
 Change log file to
 .I name
@@ -766,6 +789,18 @@ Set font to \f[I]fn\f[]
 see "allowFontOps" in
 .BR xterm (1)).
 T}
+ESC ] 104 ; \f[I]num\f[] ST	Reset color for mode 4;\f[I]num\f[]
+ESC ] 105 ; \f[I]num\f[] ST	Reset color for mode 5;\f[I]num\f[]
+ESC ] 106 ; \f[I]num\f[] ; \f[I]val\f[] ST	T{
+Exactly equal to 6;\f[I]num\f[];\f[I]val\f[]. (no "reset" logic)
+T}
+ESC ] 110 ST	T{
+Reset color for mode 10. (Codes 111-119 map to resetting modes 11-19,
+respectively.)
+T}
+ESC ] \f[I]mode\f[] ; ? ST	T{
+Query the respective property/color/etc. (modes 4,5,10-19,50)
+T}
 .TE
 .P
 It recognizes the following with slightly modified meaning
-- 
2.55.0

