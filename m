Received: from mail-108-mta183.mxroute.com (mail-108-mta183.mxroute.com [136.175.108.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EF40EB81
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207050; cv=none; b=Yyam1snssTwFlfT5qMq72YuL/YzdbNpeCrMDGqM5Lg9BnZZfVYc9SsCB2wcl2Hats/Au0WUQN7JX6UUu3/kAk9jWGM2266vvRZt+FGy9KWVsMUSwfnmiQhwOcng50KVZsgX8burQxp8wFsZcJqU2fXGV1uhu0dD9dit7DTicIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207050; c=relaxed/simple;
	bh=q4V+s5Bu6IVILxECtkIvPvSuFIrXfhyFWpaoSBNe+AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdtNrtxGxTIAHDrSX9GDdyHAWMtw+miY1BfCSS4LggdNvgW5BZpCFtKwPRM8tUKvlKzTEhjlGW4iE7ZivtkXEFQLQYzOV7XR+s2c5mNXQVgVc1Tc71IqSe6NUqx0zJSpFGaTpoHrAVC0u/Z+Src+fTEOZ9Ftq+NfcvL9OH3KVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=cDdm9XdR; arc=none smtp.client-ip=136.175.108.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="cDdm9XdR"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta183.mxroute.com (ZoneMTA) with ESMTPSA id 1a0d0a2f6c400028b2.004
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 23:38:56 +0000
X-Zone-Loop: a06f255153cfc6343071fe2c5d5a8178be8e79330e3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yi35rIX/0vWA7YQ8QUo7mlnBEr6/DCfvhqOJ411E01k=; b=cDdm9XdRZ1H8mmpL4htRIgP0ay
	/H27KnpXjFR1Rszo5XwHrlI6wIP+VY6GH58mW6ndhn8fcz1qyEElTpE17n8A1hdGfJIlSNtQkrgOG
	L4vRrL1cDB5sXLNTHpPhCNFLh6cniekZo+zyUOXWrZiE6Ru6R2Kr7qrCmurvj+1Eiq2oUaWlW6YjU
	+2tm1cKx/JiJl9lGxpgaVHU/AJOqW8hJ1Z7itOnfLMXjqgvgN0cBHecoHoI8zb0lhaS8g+sCLUvdn
	fL1ubBjNfDMo0MoJaXfD6H1Yw4iQt45uXXUpxA8xLNAg6/NxCONyvvAyq9AwvoOIYhF1pjqM4xXYi
	MxHXWIcA==;
From: Trevor Gross <tg@trevorgross.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	libc-alpha@sourceware.org,
	musl@lists.openwall.com,
	Trevor Gross <tg@trevorgross.com>
Subject: [PATCH 1/2] man/man2/chroot.2: Document that chroot is AS-safe
Date: Wed, 23 Sep 2026 23:38:18 +0000
Message-ID: <20260923233818.25289-2-tg@trevorgross.com>
In-Reply-To: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: tg@trevorgross.com

As discussed at [1], this is an async-signal-safe syscall wrapper.

Link: https://lore.kernel.org/linux-man/5db76d666377410fc105b9d527cbcd9f9ef3b332.camel@posteo.net/T/#t [1]
Signed-off-by: Trevor Gross <tg@trevorgross.com>
---
 man/man2/chroot.2        |  4 ++++
 man/man7/signal-safety.7 | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/man/man2/chroot.2 b/man/man2/chroot.2
index fa579eb83..4372ab9c7 100644
--- a/man/man2/chroot.2
+++ b/man/man2/chroot.2
@@ -150,6 +150,10 @@ inherits its parent's root directory.
 The root directory is left unchanged by
 .BR execve (2).
 .P
+.BR chroot()
+is async-signal-safe:
+it may be safely called within a signal handler.
+.P
 The magic symbolic link,
 .IR /proc/ pid /root ,
 can be used to discover a process's root directory;
diff --git a/man/man7/signal-safety.7 b/man/man7/signal-safety.7
index f63d37f75..73d716751 100644
--- a/man/man7/signal-safety.7
+++ b/man/man7/signal-safety.7
@@ -280,6 +280,16 @@ T}
 \f[B]write\f[](2)
 .TE
 .P
+Functions listed in the following table are not required to be
+async-signal-safe by POSIX, but are safe on Linux:
+.P
+.TS
+lb
+lw(24n) l.
+Function
+\f[B]chroot\f[](2)
+.TE
+.P
 Notes:
 .IP \[bu] 3
 POSIX.1-2001 and POSIX.1-2001 TC2 required the functions
-- 
2.50.1 (Apple Git-155)

