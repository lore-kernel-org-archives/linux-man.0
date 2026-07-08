Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1C3C2788
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507426; cv=none; b=m4DvclIHeIM4d1N0QQwOyZwn8E0xrfZG4tm6cddIgEgccwDSs6EG6K6rbVukQf5QftBaxl7cT+TnB70B9s2TPB2YvX2wTfcDbZeurxqrN9ahfDZvK55sroP/Gr4AhXi24HBTH+d0J4YFQuBHWbmrayqVTb+FNdvDlf/9Qmj377U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507426; c=relaxed/simple;
	bh=vn0GIBmSTq0xZZ8GV0Xj/KKXi2QPwYGY6cZue+p0xPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFtLBOmEJRi4ht0Cocoz6k75ddUYIJyj4WAbxhIV7KCwIP6JW0oEhpuYksKVAQb5gjTCWqpvm80Oq5x2kAvE3mhufS7Ds04tk5HaI6485dGm+zgiuph8HYD6obzgPIkHEBLXQfWEu4/3LtWeE/CbMBG13mFJSQ3l+gsGQ5wOga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id B70BE1003CD0D0; Wed, 08 Jul 2026 12:43:04 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id 981011003C438A;
	Wed, 08 Jul 2026 12:43:04 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH v3 1/2] console_codes.4: align spacing aids in escape codes
Date: Wed,  8 Jul 2026 12:42:44 +0200
Message-ID: <20260708104303.39708-1-jengelh@inai.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The space character is used as a visual aid in the escape code
sequences. A few lines had spacing inconsistent with the rest of the
document, so align them.

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man4/console_codes.4 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index a742cf36f..e0e88537a 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -753,14 +753,14 @@ Set icon name and window title to
 T}
 ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
 ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
-ESC ] 4 ; \f[I]num\f[]; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \f[I]txt\f[].
+ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \f[I]txt\f[].
 ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
-ESC ] 4 6 ; \f[I]name\f[] ST	T{
+ESC ] 46 ; \f[I]name\f[] ST	T{
 Change log file to
 .I name
 (normally disabled by a compile-time option).
 T}
-ESC ] 5 0 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
+ESC ] 50 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
 .TE
 .P
 It recognizes the following with slightly modified meaning
-- 
2.54.0

