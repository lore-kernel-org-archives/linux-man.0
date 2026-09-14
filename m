Received: from mta0.migadu.com (out-13.mta0.migadu.com [91.218.175.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932053D9DC9
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386768; cv=none; b=HQzAo2pY878W8zwnXqRtVbyVrrJxBs5yx/UrhSOxe/F8qIj7Uq5oQyrxswkuxQ+3eZZ7VsVGsy8YoouVeJgeRsn9aHyfXGk0ku0uKjuYqaZGjoPRm6avGDNaoX1DIJpk27Ju6nI+hu8gunrB0UQcSCkTLiAwuuxlfBc/DDhWKcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386768; c=relaxed/simple;
	bh=MUbDlSzdaWwAQu84PAR+iNUHKmprKGRjfcneOi+mO9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmrO7FCaKdiWs0GAvgTOpdN3wvPHG2NabZ0kpaTwInifNQvJ7CG6riHqXDa9l5Rm1iiQbmM6VKCvui9l5FZzv9FckzPOLmidq62SBlWNYoAcJ5aLHQC8U5w9F/jdTsvr3nHMq7H9k8uEmUrkVG1324CcBs9AMWPF/xDiS+gWoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=UV9yWQz3; arc=none smtp.client-ip=91.218.175.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="UV9yWQz3"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MUbDlSzdaWwAQu84PAR+iNUHKmprKGRjfcneOi+mO9U=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386763; v=1; x=1789991563;
 b=UV9yWQz3KAp2cZ5hqddsBcAP0VYoVEuG46YoQPQgQ0UwXCtXglLSqqkGcRH5k2cGDKeiqira
 iz3FvcDS7/kximA3DuSTJ69nYbAl9Xa+FMhKDW4NUvACXFeSQgaOm23DTnnnxtIDV05e2SnKXR+
 nm+QMmPSmDr9DPeP8/hKVfKobCRIu9x7MbUJL94GqtiShdHnEg2X7ZM7tcnpqcRhCH4aDhqZ2KV
 /cxcdIYwatslxE0FeIvx0ADjQWxp284EULiRLNHqa5fHvVWBAHuBIF3Xq4Spl3uuTDkXniPQIUJ
 WVnuIrgjR+CFcguUJdbZidn7empCOOzyBSyPZzTcSr1fQ==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a02d815d4e0e28c;
	Mon, 14 Sep 2026 11:52:43 +0000
X-Mizu-Trace-ID: 8a02d815d4e0e28c
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 1/4] man/man5/proc_pid_smaps.5: Add description
Date: Mon, 14 Sep 2026 05:51:45 -0600
Message-ID: <43dbde187d860da709a564041428026cad0ae4b4.1789386106.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca> <cover.1789386106.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=git@maxchernoff.ca; h=from:subject:message-id; bh=MUbDlSzdaWwAQu84PAR+iNUHKmprKGRjfcneOi+mO9U=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqzl9y9n3uliS5i0Q1X8zt+rd56dluh++Djlk1tEd0Dpv De/gtIyOkpZGMS4GGTFFFliMlM4viY+O7RQS3sBzBxWJpAhDFycAjAR5aUM/+zyO8QiJ+T1qL1P vN/0PuL1g8BcNsESkVc/ygLfSC04uoiR4bTrbs6p11Sv1/1Yq6i4YdqitDM3pl41Mov0SJY0b3g RwwcA
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

From the patch that first introduced the file:

> Here is a new entry developed for /proc that prints for each process
> memory area (VMA) the size of rss.
>
> [...]
>
> + smaps	 Extension of maps, presenting the rss size for each mapped file

Link: <https://lore.kernel.org/all/3f250c7105010613115554b9d9@mail.gmail.com/T>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
---
 man/man5/proc_pid_smaps.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
index 9c433dbc1e60..963136109ad8 100644
--- a/man/man5/proc_pid_smaps.5
+++ b/man/man5/proc_pid_smaps.5
@@ -7,7 +7,7 @@
 .\"
 .TH proc_pid_smaps 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/smaps \- XXX: What does 's' in "smaps" stand for?
+/proc/pid/smaps \- size of mapped memory regions
 .SH DESCRIPTION
 .TP
 .IR /proc/ pid /smaps " (since Linux 2.6.14)"
-- 
2.55.0

