Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD6663B9
	for <linux-man@vger.kernel.org>; Sat, 21 Feb 2026 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686172; cv=none; b=T3Ajq5/KwcNsDh8kyDBTWK99mUKie171+mD9U1YG5HcCzegTfQqHXrdTQIU6TXoNUWjL1idbarMfXeTeLwkxZj49TPkgMRai3nNY66F9AHwtPJIOGXBhp8IiIzre9auLuvGDBEIIN9Mn4k/FK62XeDEOkG9tWQifwAnl5B/962g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686172; c=relaxed/simple;
	bh=fuxJh/ChA0/0kZJyImxQH+LsnhAaMGKUMA+RD3lVLTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUNbZRkaafOrrtZISs0fFtmtxKw7Azl1n9mZolWkO8THCpGzWr9VtXA1WTiStrdkOAB8o2Gew8Ldt+uf1FUo6ArQAUsk5g3BzKZVoBhlDxJFqmqQkP3raTUQb+t9SvwHvrid2xUbj9mdwhCVREpmsqULLBM7oxv/1zr56Q4xykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKG/5te7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKG/5te7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81859C4CEF7;
	Sat, 21 Feb 2026 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771686172;
	bh=fuxJh/ChA0/0kZJyImxQH+LsnhAaMGKUMA+RD3lVLTY=;
	h=Date:From:To:Cc:Subject:From;
	b=JKG/5te7rmNcSWuFaC0NSJh0oN2sKw3aVyOLuZ2oFaTGRloKWMVngZ6jahcZQjd8o
	 S+b3qaQCUMs3yv29yHPvxKDyswcv5PXxPONSCLnH3uKhB8QLBbH6a9PpFEc8cM3eGu
	 c8wfZAimMr8DfLbOU6ekga98tcjuZwOBFTuwCbWLAoVjtVzKFeYmejubjA/L9PJGYP
	 k5KNaew68iQogP3qZ7xr+/l+NGTHExhoTB9Zis3W3ufQQIyQUycE3F0JXTfd6mack5
	 1y0aKd62OwUDFNNL3LNylDEYo/1aBTL5qIDguGT/T/+n6aRcScglSqI8pAeUiy22SY
	 QK1LyIb71iHpg==
Date: Sat, 21 Feb 2026 16:02:49 +0100
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, bug-gnulib@gnu.org
Subject: [PATCH v1 0/1] Document strnul(3)
Message-ID: <cover.1771686088.git.alx@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

gnulib has added strnul(3).  I hope libc implementation eventually pick
up this API.  Let's document it in a manual page.


Have a lovely day!
Alex


Alejandro Colomar (1):
  man/man3/strnul.3: New page

 man/man3/strnul.3 | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 man/man3/strnul.3

Range-diff against v0:
-:  ------------ > 1:  7b2c4b363f65 man/man3/strnul.3: New page

base-commit: 707b47ed0e29dd8ebab93c6c5baa400320160c8b
-- 
2.51.0

