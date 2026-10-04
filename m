Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C275245008
	for <linux-man@vger.kernel.org>; Sun,  4 Oct 2026 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103795; cv=none; b=IJLy6KFuU6JGbyY2hXwVmEBRKmCYxOBN2VK7XRiEKX69nLsU+wzSf/8925Uj0bpX+5DCBiRM4ZZfw0nhTeTjB4BNf9/unmNvRboU8s9xrQ7XlAsPO7LQy6AtjIuFZPTrqvGVNpghb80CblKONJzCS7NXNzNiCTMtDTCtgLvUVEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103795; c=relaxed/simple;
	bh=3K39z77q7gY0FJLPEX7NFz3O2hV//isTF98vMIZn9d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ozjPKwxwZ+7UBAVj3Ze9/cHJ7mbREphB6eEePTODSrdfAucI+7dUpUOgr6VRuxTyEU2wjmq6uOjf1RLHbpWT5T7LL4rpMjOvE+iKChHhWRzfb8ZLT6rZPRzcX9DucX0MtghYDE60HjtevW5TMDcGgL71XhQfmF0ZRTuMwzQRMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETbUtz9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETbUtz9c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94A44C2BCB9;
	Sun,  4 Oct 2026 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791103794;
	bh=3K39z77q7gY0FJLPEX7NFz3O2hV//isTF98vMIZn9d0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ETbUtz9cbdD2dRPURqdD4jmnxAC3/LWxMxAAJR3+g4/BF9qiu+6oUnLhiPzuc2uBi
	 tYVpLXIl8kuhK+ce3HrbA1s/8cy+vsh9/ZU2UtH5OgTUnRXVmZwWMs1uERtyJCZbIs
	 hcVOj5yDH/6eGSVzB3nf6rt1wwZabvkzsTnrnm5lgL2EgIn+ilGEj9JVMJqHiv2Tj9
	 8P97/nF63Ys4SMJ2/V2AdpPOZAp5opvHltk9Y43BdhMgLx72ZabtEQH66bAl5BMXNf
	 KWaNBJi7v0y/m0la1so7RDIyf+YTvCiWx/IKIGjWn33gZexWHZyMjZ7N6daTRfIBZA
	 IruqjWngaM/Xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C318CA5FEC;
	Sun,  4 Oct 2026 08:49:54 +0000 (UTC)
From: Ben Kuo via B4 Relay <devnull+ben.kuo.tw.proton.me@kernel.org>
Date: Sun, 04 Oct 2026 16:49:17 +0800
Subject: [PATCH] man/man7/mount_namespaces.7: Add missing 'filesystemtype'
 argument to mount(2)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-mount-ns-mount-args-v1-1-a344b18c0c22@proton.me>
X-B4-Tracking: v=1; b=H4sIAAwTwmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMT3dz80rwS3bxiKCOxKL1Y19LC0tIgLSUxyczSUgmos6AoNS2zAmx
 qdGxtLQCarbFsZQAAAA==
X-Change-ID: 20261004-mount-ns-mount-args-98990fdab699
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Ben Kuo <ben.kuo.tw@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791103793; l=1247;
 i=ben.kuo.tw@proton.me; s=20261004; h=from:subject:message-id;
 bh=0hTM8yyVZi7R4ypo1hfKJWwCiZ9rEiA1Wk0lIvHRdeY=;
 b=jUYOYgGdNl3mLrxOG8sZfgNgw24FpfcqrKVh8wA86pxJMm0/Q9KhlbJx94BHtYdUBT1A6ksus
 oZdRFmRjEizANa/BT6qLVcaoMbuSJvbO+cSz4ZlG2zCbekKMJE4z3Xk
X-Developer-Key: i=ben.kuo.tw@proton.me; a=ed25519;
 pk=gXi9Dh9ncDWJiQmei79Ms5wulBAOhOVhaWE+qzS5nXY=
X-Endpoint-Received: by B4 Relay for ben.kuo.tw@proton.me/20261004 with
 auth_id=1107
X-Original-From: Ben Kuo <ben.kuo.tw@proton.me>
Reply-To: ben.kuo.tw@proton.me

From: Ben Kuo <ben.kuo.tw@proton.me>

The example call omits the 'filesystemtype' argument, so it passes
four arguments to mount(2), which takes five.  As written, it fails
to compile:

	error: too few arguments to function 'mount'

Tested by compiling the corrected call with gcc 14.2.0 and running
it after unshare(CLONE_NEWNS) on Linux 6.12 (Debian 13, arm64);
findmnt(8) shows '/' with slave propagation.

Fixes: a2fc45a9f (2019-10-07; "mount_namespaces.7: It may be desirable to disable propagation after creating a namespace")
Signed-off-by: Ben Kuo <ben.kuo.tw@proton.me>
---
 man/man7/mount_namespaces.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/mount_namespaces.7 b/man/man7/mount_namespaces.7
index 8ed43a34623310f5c0b6b2071815340b287415aa..8f9c8e6e147a42b85d9d2cc2c691037ef82395f5 100644
--- a/man/man7/mount_namespaces.7
+++ b/man/man7/mount_namespaces.7
@@ -1051,7 +1051,7 @@ using a call such as the following:
 .P
 .in +4n
 .EX
-mount(NULL, "/", MS_SLAVE | MS_REC, NULL);
+mount(NULL, "/", NULL, MS_SLAVE | MS_REC, NULL);
 .EE
 .in
 .P

---
base-commit: 31d36870d5f239d485772f1dbf17948bc35bee80
change-id: 20261004-mount-ns-mount-args-98990fdab699

Best regards,
-- 
Ben Kuo <ben.kuo.tw@proton.me>


