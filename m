Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29936B04E
	for <linux-man@vger.kernel.org>; Fri, 19 Jun 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863676; cv=none; b=fm4uGAWsfo90tgtgNOs8bMvhNXSJ8xYz6SiVgJAW6SHgztqj1YL1/DFbRhovki882qNr4cyUy7U9/W3Y5Fn+AO3fMs3Nbrb9iZ4Utwm7lyzgCfrRVNQBPSixZMJLlhQa//0LtEyHxHJyDFFtCDLPFCGb1XXCn5IlZB8AFnZzsRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863676; c=relaxed/simple;
	bh=fL8+KLGQGiSfCXOK4LbYQ0UrP+sPeC/fNBkejn+dBZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aydt1IRm9Mx8jbSmOF52mxaD/i45ba+TaDM8GnXaQheAldFu8pWX1tlu47xZ4PKUOCw360VP9UYVHg2CDUb3mMkvtd5d2U2zs7/A6GVuWfVaHPXcmngaQptAxZSi+DeQO29oLWlwZMSiJGlKVh510zYK0ZIPFWPkrO3PIn/W7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id CD3DA1003F05BD; Fri, 19 Jun 2026 12:07:50 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id A94FC1003F05BD;
	Fri, 19 Jun 2026 12:07:50 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2] console_codes.4: document more xterm codes
Date: Fri, 19 Jun 2026 12:07:11 +0200
Message-ID: <20260619100750.73857-1-jengelh@inai.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
v2:
* Removed a copy-paste leftover in the wording of OSC mode 17/19

 man/man4/console_codes.4 | 48 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index a742cf36f..d92522e27 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -753,14 +753,54 @@ Set icon name and window title to
 T}
 ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
 ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
-ESC ] 4 ; \f[I]num\f[]; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \f[I]txt\f[].
-ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
-ESC ] 4 6 ; \f[I]name\f[] ST	T{
+ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) to \f[I]txt\f[].
+ESC ] 5 ; 0 ; \f[I]txt\f[] ST	Set the color for bold substitution to \f[I]txt\f[].
+ESC ] 5 ; 1 ; \f[I]txt\f[] ST	Set the color for underline substitution to \f[I]txt\f[].
+ESC ] 5 ; 2 ; \f[I]txt\f[] ST	Set the color for blinking substitution to \f[I]txt\f[].
+ESC ] 5 ; 3 ; \f[I]txt\f[] ST	T{
+Set the color for reverse substitution to \f[I]txt\f[]. Because xterm still
+reverses fg-bg pairs, the effect is that only the background of a character
+cell is colorized this way.
+T}
+ESC ] 5 ; 4 ; \f[I]txt\f[] ST	Set the color for italic substitution to \f[I]txt\f[].
+ESC ] 6 ; 0 ; \f[I]val\f[] ST	Toggle bold rendition: 0=bold, 1=substitute by color.
+ESC ] 6 ; 1 ; \f[I]val\f[] ST	Toggle underscore rendition: 0=underscore, 1=color.
+ESC ] 6 ; 2 ; \f[I]val\f[] ST	Toggle blinking rendition: 0=blinking, 1=color.
+ESC ] 6 ; 3 ; \f[I]val\f[] ST	Toggle reverse rendition: 0=reverse, 1=color.
+ESC ] 6 ; 4 ; \f[I]val\f[] ST	Toggle italic rendition: 0=italic, 1=color.
+ESC ] 10 ; \f[I]txt\f[] ST	Set the foreground text color to \f[I]txt\f[].
+ESC ] 11 ; \f[I]txt\f[] ST	Set the background color to \f[I]txt\f[].
+ESC ] 12 ; \f[I]txt\f[] ST	Set the text cursor color to \f[I]txt\f[].
+ESC ] 13 ; \f[I]txt\f[] ST	Set the mouse cursor foreground color to \f[I]txt\f[].
+ESC ] 14 ; \f[I]txt\f[] ST	Set the mouse cursor background color to \f[I]txt\f[].
+ESC ] 15 ; \f[I]txt\f[] ST	Set the Tektronix foreground color to \f[I]txt\f[].
+ESC ] 16 ; \f[I]txt\f[] ST	Set the Tektronix background color to \f[I]txt\f[].
+ESC ] 17 ; \f[I]txt\f[] ST	T{
+Set the background text color for reverse video (provided it is not substituted
+with 6;3;1) to \f[I]txt\f[].
+T}
+ESC ] 18 ; \f[I]txt\f[] ST	Set the Tektronix cursor color to \f[I]txt\f[].
+ESC ] 19 ; \f[I]txt\f[] ST	T{
+Set the foreground text color for reverse video (provided it is not substituted
+with 6;3;1) to \f[I]txt\f[].
+T}
+ESC ] 46 ; \f[I]name\f[] ST	T{
 Change log file to
 .I name
 (normally disabled by a compile-time option).
 T}
-ESC ] 5 0 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
+ESC ] 50 ; \f[I]fn\f[] ST	T{
+Set font to \f[I]fn\f[] (normally disabled; cf. the "allowFontOps" resource)
+T}
+ESC ] 104 ; \f[I]num\f[] ST	Reset color for mode 4;\f[I]num\f[]
+ESC ] 105 ; \f[I]num\f[] ST	Reset color for mode 5;\f[I]num\f[]
+ESC ] 106 ; \f[I]num\f[] ; \f[I]val\f[] ST	T{
+Exactly equal to 6;\f[I]num\f[];\f[I]val\f[]. (no "reset" logic)
+T}
+ESC ] 110 ST	Reset color for mode 10. (The pattern repeats until 119.)
+ESC ] \f[I]mode\f[] ; ? ST	T{
+Query the respective property/color/etc. (modes 4,5,10-19,50)
+T}
 .TE
 .P
 It recognizes the following with slightly modified meaning
-- 
2.54.0

