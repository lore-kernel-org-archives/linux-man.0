Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA68435A83
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512902; cv=none; b=JHSpBX2HCpsZf2zB3n7OdsLQoBetApAGZAxkIxsPZSc7p/XbCpbzQkzmPceU8Gn5zj19HQ7WBzQwT1KaD20vVZ9KRrSbKGUuohrjogfI09PQC83ImkcVHvt8tmsNeaNPpj8+cdvKHPyFWxFTfXuyL4h9x9N/uQaCTqWSiQvJqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512902; c=relaxed/simple;
	bh=3F0OSZFE+xMYcYFe0twcEgY9m9GjaJrtyEgXhww1JOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnSRxMlCVLIhmmV0Iw7UadwdhlPFA3eYK4j+qQncEUAL7X82fEDb4xwbhoeYfq20SYsamkz5M9GRDk+3z08+xRloM7ABT8w9qN/8jhG5K7OEqurMXfuyXJWdWRdkaQlKtrM/Sa8o0wM5AcQz4CeVNJfV+XKCOT39rrdrGALQ5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id E8D041003CDBC1; Wed, 08 Jul 2026 14:14:58 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id CFAF21003CD0D5;
	Wed, 08 Jul 2026 14:14:58 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: [PATCH 2/4] console_codes.4: rephrase description for xterm's ESC ] 10 command
Date: Wed,  8 Jul 2026 14:14:56 +0200
Message-ID: <20260708121458.46465-2-jengelh@inai.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708121458.46465-1-jengelh@inai.de>
References: <20260708121458.46465-1-jengelh@inai.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The term "dynamic" text color is too unspecific.
Since xterm has more codes for tuning colors, all colors
could be considered "dynamic".

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man4/console_codes.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
index 28ee4c2fc..2fa8368e1 100644
--- a/man/man4/console_codes.4
+++ b/man/man4/console_codes.4
@@ -754,7 +754,7 @@ T}
 ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
 ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
 ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) to \f[I]txt\f[].
-ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
+ESC ] 10 ; \f[I]txt\f[] ST	Set the foreground text color to \f[I]txt\f[].
 ESC ] 46 ; \f[I]name\f[] ST	T{
 Change log file to
 .I name
-- 
2.54.0

