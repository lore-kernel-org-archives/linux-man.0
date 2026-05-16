Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885333ADB0
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951533; cv=none; b=Y+bIH+wgb6SIk2XURcQfhhqjy7oO9TSmy5ujbETkF7knhee0aZTuZAsNYgQP5eUdvQBdnIWpSgm3NYZ/Xnf3HC5znhIKLrsKnSH6V9flVGwUYCxCAchtyd3/Fyi6RNwO38nFSFZGqOP254judwoWOmwkUBP/VN89tXZPMbjqKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951533; c=relaxed/simple;
	bh=N41aUoBv2NDhepJXDuOJEtuMkoZhRIiy/wNlQy4X1wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5YGAZcOZgKSLPtPsWrUVzFeSoTiYAO8ptJ1PKdv5ta6uJZzFiwwS/bCWHKeqJe+ZNh48SJsVgsc03xvFZmf6Xlx0eqha7WnK2teyNJNfsCRLv8ExVMs4T81+Kqm5mMi5C7/oOJ/JfRIPuPPEDJQOEzH0HmYX6h/hEdn9maj6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESl1Itnd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESl1Itnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5D2C19425;
	Sat, 16 May 2026 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778951531;
	bh=N41aUoBv2NDhepJXDuOJEtuMkoZhRIiy/wNlQy4X1wQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ESl1ItndWiIWhbPl41jJHUuSFVhEf7KVC+GeRE1DK1R7Q/upnVJC1H1jmsXBZHIpo
	 e3aurw/TlWppdETafIjlURbtXB7P0hGwc2xQuD333GS5oGKnRD/Nwwc34cZiSdTGhL
	 6y8kgb8/gKZWMaClYE9gp689wbgpVduGYEC74MDRT1T5AYrKWTGEoVnUH9d7/w3Mlc
	 jpIh+weevCSMJynyGFV2CsM6rZ1zjQfeFqkj7X4nadUMlCb7pHBQmr0xs/xszHVcfM
	 mjH/p07/ehsw5NmjHuvpjE7ZhZrdYkblMWx3nk/NhsnErNjs5VyQA68FSRABALCLAs
	 j78PlROScUp+Q==
Date: Sat, 16 May 2026 19:12:08 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org, Jan Kara <jack@suse.cz>
Cc: Alejandro Colomar <alx@kernel.org>, Petr Gajdos <pgajdos@suse.cz>, 
	Jan Blunck <jblunck@novell.com>
Subject: [PATCH v1] man/man2/quotactl.2: tfix
Message-ID: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

It seems most likely that this was a typo, and that Q_XQUOTAON was
meant.

Fixes: 1eeddf25 (2010-06-16; "quotactl.2: Major updates")
Cc: Jan Kara <jack@suse.cz>
Cc: Petr Gajdos <pgajdos@suse.cz>
Cc: Jan Blunck <jblunck@novell.com>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi Jan,

I'm working on this page, and found what seems to be a typo.  I'd like
you to confirm, in case I'm missing something.


Have a lovely day!
Alex

 man/man2/quotactl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/quotactl.2 b/man/man2/quotactl.2
index ef050714..bf361409 100644
--- a/man/man2/quotactl.2
+++ b/man/man2/quotactl.2
@@ -130,7 +130,7 @@ .SH DESCRIPTION
 .B Q_XQUOTAOFF
 Turn off quotas for an XFS filesystem.
 As with
-.BR Q_QUOTAON (2const),
+.BR Q_XQUOTAON (2const),
 XFS filesystems expect a pointer to an
 .I "unsigned int"
 that specifies whether quota accounting and/or limit enforcement need

Range-diff against v0:
-:  -------- > 1:  9d328eab man/man2/quotactl.2: tfix
-- 
2.53.0

