Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A23CD8C9
	for <linux-man@vger.kernel.org>; Fri, 10 Jul 2026 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721448; cv=none; b=NdyCY5H3r62XkiCvE21huQFyr5q9qgzjTazBDAt8e8UWX4c/x6P1RtFpvdSPtANT5AJosL8SdI8mK0nat4OPOEL7loSf9tUbtV7qIl4L8H97fOjc2SQAW+p/orliu8+uvj2TSiXqE+IBYAd065KHKrKWW6sIxUvMCJ66BmfinCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721448; c=relaxed/simple;
	bh=qHdpToQQXal5sJ69akJRDTPUqddfT7bH/FNH55vce6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1oS0zdlb534SO14pozgGDR89qfyvOwx/IlbjUifQygi3raHwv1E8cHiPlKoF5DkLWGMccSzVT4H8vgU0+YRSg/m0c73k9Px65KJ8Ab11aHlbewNWtC09hjip7rtK/h4WNsw44B49UHMq8m+XeLRL2OzoPSJilNZoNpasc4u1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id 8FF581003C5488; Sat, 11 Jul 2026 00:10:35 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id 747781003C5488;
	Sat, 11 Jul 2026 00:10:35 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH 1/2] console_codes.4: mention caveats for xterm's ESC ] 50 command
Date: Sat, 11 Jul 2026 00:10:34 +0200
Message-ID: <20260710221035.26529-1-jengelh@inai.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fonts are only settable if xterm was launched with the right options
(or X11 resources) that would allow this operation.

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man4/console_codes.4 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index 2fa8368e1..534510a4b 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -760,7 +760,10 @@ Change log file to
 .I name
 (normally disabled by a compile-time option).
 T}
-ESC ] 50 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
+ESC ] 50 ; \f[I]fn\f[] ST	T{
+Set font to \f[I]fn\f[] (the escape code is normally disabled;
+consult the xterm manpage for the "allowFontOps" setting)
+T}
 .TE
 .P
 It recognizes the following with slightly modified meaning
-- 
2.54.0

