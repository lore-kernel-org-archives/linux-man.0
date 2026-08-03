Received: from dmf-c02.shizuoka.ac.jp (dmf-c02.shizuoka.ac.jp [133.70.128.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1203C1094
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=133.70.128.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763260; cv=none; b=LUf/TeJoboOGKkxSwWywa4biZGt07xLKGhC8mSY1U0FDNGGeGkFLmu2ag3KN//i9BJKRhoBz8q3vZs3LOKoxAcG1x6/mBlDsebgfuwweIQxUl5UHX0CIzqJEFJMOE/AowCmDxdeV0U53zlwdI/NoEsy10ZVKbQnF+2I8iebarwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763260; c=relaxed/simple;
	bh=pL/wF6+kUIcEFAQ939d/lbRzJi9bEvaJGkcNOI7YXt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HG0zi5V4/TzzDFToQoR1ryP4lYssr+C3PPitbSm7ZT4ppn0cbzSUv6T8B0m+X+1/481sMdKy2dSPWHb8OjpqoZHOszcpTJWpUl7YgOLqrjTELC626KE96bKMlhWSBiUpbgfrVcW1kKKL3I3bd9KdhbbVJW4DLM6WTQZamxOawJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shizuoka.ac.jp; spf=pass smtp.mailfrom=shizuoka.ac.jp; arc=none smtp.client-ip=133.70.128.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shizuoka.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shizuoka.ac.jp
X-ASG-Debug-ID: 1785762389-1bc91a790a5e9a30001-5hessv
Received: from ms.ipc.shizuoka.ac.jp (ms.ipc.shizuoka.ac.jp [133.70.128.240]) by dmf-c02.shizuoka.ac.jp with ESMTP id 2pfrvaD0hBA2mzlZ (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO); Mon, 03 Aug 2026 22:06:29 +0900 (JST)
X-Barracuda-Envelope-From: saito.ryota.23@shizuoka.ac.jp
X-Barracuda-Effective-Source-IP: ms.ipc.shizuoka.ac.jp[133.70.128.240]
X-Barracuda-Apparent-Source-IP: 133.70.128.240
Received: from thinkpad1.lan (dm59.shizuoka.ac.jp [133.70.129.59])
	by ms.ipc.shizuoka.ac.jp (ms) with ESMTPSA id 921CA4167A03;
	Mon,  3 Aug 2026 22:06:29 +0900 (JST)
From: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>
To: Alejandro Colomar <alx@kernel.org>
Cc: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>,
	linux-man@vger.kernel.org
Subject: [PATCH] man/man5/elf.5: Fix description of e_flags
Date: Mon,  3 Aug 2026 22:05:43 +0900
X-ASG-Orig-Subj: [PATCH] man/man5/elf.5: Fix description of e_flags
Message-ID: <20260803130543.590173-1-saito.ryota.23@shizuoka.ac.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Barracuda-Connect: ms.ipc.shizuoka.ac.jp[133.70.128.240]
X-Barracuda-Start-Time: 1785762389
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://133.70.128.214:443/cgi-mod/mark.cgi
Received-SPF: softfail (shizuoka.ac.jp: domain of transitioning saito.ryota.23@shizuoka.ac.jp does not designate 133.70.129.59 as permitted sender)
X-Virus-Scanned: by bsmtpd at shizuoka.ac.jp
X-Barracuda-Scan-Msg-Size: 1074
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.20
X-Barracuda-Spam-Status: No, SCORE=0.20 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=BSF_SC7_SA298e, BSF_SPF_SOFTFAIL
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.162436
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.00 BSF_SPF_SOFTFAIL       Custom Rule SPF Softfail
	0.20 BSF_SC7_SA298e         Custom Rule SA298e

Processor-specific e_flags are defined by the ABI supplements of many
architectures (e.g., EF_RISCV_RVC, EF_ARM_EABI_VER5), and glibc's
<elf.h> currently defines over 150 EF_* constants.  Replace the
incorrect statement with one that does not depend on the current set
of defined flags.

Signed-off-by: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>
---
Range-diff:
-:  --------- > 1:  06a472163 man/man5/elf.5: Fix description of e_flags

 man/man5/elf.5 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man5/elf.5 b/man/man5/elf.5
index 67544f4e6..ab5d2a21f 100644
--- a/man/man5/elf.5
+++ b/man/man5/elf.5
@@ -509,7 +509,8 @@ file has no section header table, this member holds zero.
 .I e_flags
 This member holds processor-specific flags associated with the file.
 Flag names take the form EF_`machine_flag'.
-Currently, no flags have been defined.
+The defined flags and their meanings
+depend on the target architecture and its ABI.
 .TP
 .I e_ehsize
 This member holds the ELF header's size in bytes.
-- 
2.43.0

