Received: from mail.helgefjell.de (mail.helgefjell.de [142.132.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AB2DC32B
	for <linux-man@vger.kernel.org>; Sun, 24 Aug 2025 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.201.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756046926; cv=none; b=pouFD/jSfdGe3IKJgV0YAVQ7zBgT/ewWsr6GNK4O13qH6UOZLj5P8cgRrn0ZeIFo4wACbQ2hGgqqd6YRobU34DMbY/O7dvxmVC2VJZVoqJUObYhotKi8TMiKVOp2YGDvAfByyLqmJwWDxNzOC5M+73rH6HBRjvxSD4Kk65L7tuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756046926; c=relaxed/simple;
	bh=RG3rd9HAY4YQ+JKYmKZ4Cheeve5e08xEiVr1z3y7tqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Koz/TdsycUX6uLxbwvp184cwupYfju194WQ75Dt+6UiohDWk/fjgGniqD2B6+QZKA1F3thxf3muHnkLQZJDty2j0NNvF+1IW/DwLPznlwjg8guLoGR0swhvrymafiEa2FUw5CTi1K/Uti4f7bCoIwqOHnpqsH+m5VFB3CU1+qDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helgefjell.de; spf=pass smtp.mailfrom=helgefjell.de; dkim=pass (2048-bit key) header.d=helgefjell.de header.i=@helgefjell.de header.b=R72Y3ZzK; arc=none smtp.client-ip=142.132.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helgefjell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helgefjell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helgefjell.de header.i=@helgefjell.de header.b="R72Y3ZzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helgefjell.de;
	s=selector.helgefjell; t=1756046915;
	bh=Lm8vSLluFAc4VviIYm8N/Ttab15E2WnwoJgL59z30Yo=;
	h=Date:From:To:Cc:Subject;
	b=R72Y3ZzKewZKYKsBzgMZ3ZZoUlECHTA507aqx21/5GLFGmJWTZMqwQoREkpVQ5V68
	 sHawJjRkjKCiLzLEV5crO+yks3lOrlqimHwdJsYhfsbsvORL6cx4EqVVf8C7uEYeCi
	 tXHkReTPGRDtrBqPNA4rC5HJIsuwDuPgul1hxZslAY6NNR0SkAo/Dx+snsHZAeAsGV
	 y6DQ1c11xhFNVLO8OJdhqUuNZwnSalmWkNvPqD+1ukC2kP9+jDsOlyGJUlxlXNxN9T
	 7KG5QHqDuLzG6BJ6gUfltQg/qxXOw0QMnMTD20cGoiaGpuMhpFA05umOsYqrnmMMRo
	 8tuiip5q8ikCg==
Original-Subject: Issue in man page swab.3
Author: Helge Kreutzmann <debian@helgefjell.de>
Original-Cc: mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by mail.helgefjell.de with local
  id 0000000000021606.0000000068AB2643.00138D4B; Sun, 24 Aug 2025 14:48:35 +0000
Date: Sun, 24 Aug 2025 14:48:35 +0000
From: Helge Kreutzmann <debian@helgefjell.de>
To: alx@kernel.org
Cc: mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page swab.3
Message-ID: <aKsmQ56DLXLsffUb@meinfjell.helgefjelltest.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian

Without further ado, the following was found:

Issue:    B<…>ssize_t n → B<…ssize_t> I<n>

"B<void swab(>ssize_t n;\n"
"B<          const void >I<from>B<[restrict >I<n>B<], void >I<to>B<[restrict >I<n>B<],>\n"
"B<          ssize_t >I<n>B<);>\n"
