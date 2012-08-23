From: Simon Paillard <spaillard@debian.org>
Subject: Bug#633505: manpages-dev: fts(3) has inaccurate description of
	physical vs. logical
Date: Thu, 23 Aug 2012 22:28:55 +0200
Message-ID: <20120823202855.GA11044@glenfiddich.mraw.org>
References: <20110710213043.7675.10278.reportbug@orbital.spiral-arm.org>
Reply-To: 633505@bugs.debian.org, 633505@bugs.debian.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.633505.B633505.13457538383712@bugs.debian.org>
Content-Disposition: inline
In-Reply-To: <20110710213043.7675.10278.reportbug@orbital.spiral-arm.org>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: James Youngman <jay@gnu.org>, 633505@bugs.debian.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

forwarded 633505 linux-man@vger.kernel.org
thanks

Hi,

On Sun, Jul 10, 2011 at 10:30:43PM +0100, James Youngman wrote:
> Package: manpages-dev
> Version: 3.27-1
> Severity: minor
> 
> 
> The descriptions of the effects of FTS_LOGICAL and FTS_PHISICAL in the
> subsection entitled fts_open() are correct.  But the DESCRIPTION
> section is incorrect.  It says:
> 
>   It is possible to walk the hierarchy "logically" (ignoring symbolic
>   links) or physically (visiting symbolic links), order the walk of
>   the hierarchy or prune and/or revisit portions of the hierarchy.
> 
> This is not accurate.  Symbolic links are never ignored.  Here is a
> clearer description:
> 
>   It is possible to walk the hierarchy "logically" (visiting the files
>   that symbolic links point to, like "find -L") or "physically"
>   (visiting the symbolic links themselves instead, like "find -P") ,
>   order the walk of the hierarchy or prune and/or revisit portions of
>   the hierarchy.
 
Thanks for the report James, confirmed by test, patch a bit modified and
forwarded upstream.

-- 
Simon Paillard

--OgqxwSJOaUobr8KG
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="fts_open.3.bug633505.patch"

diff --git a/man3/fts.3 b/man3/fts.3
index 1c49155..6eedd4e 100644
--- a/man3/fts.3
+++ b/man3/fts.3
@@ -77,8 +77,10 @@ In general, directories are visited two distinguishable times; in preorder
 (before any of their descendants are visited) and in postorder (after all
 of their descendants have been visited).
 Files are visited once.
-It is possible to walk the hierarchy "logically" (ignoring symbolic links)
-or physically (visiting symbolic links), order the walk of the hierarchy or
+It is possible to walk the hierarchy "logically" (visiting the files that
+symbolic links point to)
+or physically (visiting the symbolic links themselves), order the walk of the
+hierarchy or
 prune and/or revisit portions of the hierarchy.
 .PP
 Two structures are defined (and typedef'd) in the include file

--OgqxwSJOaUobr8KG--
