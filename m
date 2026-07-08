Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D1433BAB
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512903; cv=none; b=Nn+sRX8xKg+W9px+hnGNqpwBLQx9zUAaqfXU+ZIo/R0GWgx3sGSHEkWPtjxiMTKQlkVcg+FZhRaDyJkL8IHs/kYJTfoJGSjhut9nsHn+4vw/Yb3ixrP2VdwGaM4lZPLg91ZAKA+NOfYjdTBjg9BnkazFhajBy+2Dnf+t0qyO16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512903; c=relaxed/simple;
	bh=taWll8TLReWH/f2Jhw8lzr0ZI5gESLftZg7Ej0xrvjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYlluP6+BnmHFyIrtRLzg170oRaBxNptZ7QWODp55LX4EJmGxgdrFeKQqxJYEFEpI+DEnY9Tq2RcwkOaz1N5s7w2Iz3X1egzJZCMt3eIbJ8Gsxarq7vIYrmsI2QaSoKgGirnnbyNT2fhAJsoF79ek3w70TStZi6emcDRrGxvqEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id DE10E1003CD494; Wed, 08 Jul 2026 14:14:58 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id C28701003CD0D3;
	Wed, 08 Jul 2026 14:14:58 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH 1/4] console_codes.4: rephrase description for xterm's ESC ] 4 command
Date: Wed,  8 Jul 2026 14:14:55 +0200
Message-ID: <20260708121458.46465-1-jengelh@inai.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The \e]4 code is capable of modifying xterm's entire 256-slot palette,
not just the ANSI sub-portion thereof.

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man4/console_codes.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index e0e88537a..28ee4c2fc 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -753,7 +753,7 @@ Set icon name and window title to
 T}
 ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
 ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
-ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \f[I]txt\f[].
+ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) to \f[I]txt\f[].
 ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
 ESC ] 46 ; \f[I]name\f[] ST	T{
 Change log file to
-- 
2.54.0

