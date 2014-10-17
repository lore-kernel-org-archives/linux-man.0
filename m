From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: POSIX Safety
Date: Fri, 17 Oct 2014 07:00:15 +0200
Message-ID: <5440A25F.9090507@gmail.com>
References: <53AD7575.9080202@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AD7575.9080202-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/27/2014 03:45 PM, Carlos O'Donell wrote:
> Michael,
>=20
> I submit the following text to the Linux Kernel Man Pages project.
> The goal being that we copy-edit this into a safety attributes
> man page and thus harmonize the definition of thread safe,
> async-cancel safe, and async-signal safe between glibc and the
> linux kernel man page project.
>=20
> Please feel free to use all, some, or non of this document. It is
> included under GPLv2+_DOC_FULL for your use in the linux kernel man
> pages project. It is presently formatted as info, please feel free
> to reformat. For example the HURD parts of the doucment do not apply
> since the man pages are intended for systems using the Linux
> kernel e.g. GNU/Linux.
>=20
> As always I look forward to continued harmonization between the
> glibc manual and linux kernel man pages project :-)

Hi Carlos,

I started editing up some of this material for inclusion in
a man page. As well as the Copyright, I do find it useful to
list the authors for the text. Is that you, Alexandre, or both?

Thanks,

Michael


> ---
> .\" Copyright (c) 2014, Red Hat, Inc.
> .\"
> .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> .\" This is free documentation; you can redistribute it and/or
> .\" modify it under the terms of the GNU General Public License as
> .\" published by the Free Software Foundation; either version 2 of
> .\" the License, or (at your option) any later version.
> .\"
> .\" The GNU General Public License's references to "object code"
> .\" and "executables" are to be interpreted as the output of any
> .\" document formatting or typesetting system, including
> .\" intermediate and printed output.
> .\"
> .\" This manual is distributed in the hope that it will be useful,
> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> .\" GNU General Public License for more details.
> .\"
> .\" You should have received a copy of the GNU General Public
> .\" License along with this manual; if not, see
> .\" <http://www.gnu.org/licenses/>.
> .\" %%%LICENSE_END
>=20
> @node POSIX Safety Concepts, Unsafe Features, , POSIX
> @subsubsection POSIX Safety Concepts
> @cindex POSIX Safety Concepts
>=20
> This manual documents various safety properties of @glibcadj{}
> functions, in lines that follow their prototypes and look like:
>=20
> @sampsafety{@prelim{}@mtsafe{}@assafe{}@acsafe{}}
>=20
> The properties are assessed according to the criteria set forth in th=
e
> POSIX standard for such safety contexts as Thread-, Async-Signal- and
> Async-Cancel- -Safety.  Intuitive definitions of these properties,
> attempting to capture the meaning of the standard definitions, follow=
=2E
>=20
> @itemize @bullet
>=20
> @item
> @cindex MT-Safe
> @cindex Thread-Safe
> @code{MT-Safe} or Thread-Safe functions are safe to call in the prese=
nce
> of other threads.  MT, in MT-Safe, stands for Multi Thread.
>=20
> Being MT-Safe does not imply a function is atomic, nor that it uses a=
ny
> of the memory synchronization mechanisms POSIX exposes to users.  It =
is
> even possible that calling MT-Safe functions in sequence does not yie=
ld
> an MT-Safe combination.  For example, having a thread call two MT-Saf=
e
> functions one right after the other does not guarantee behavior
> equivalent to atomic execution of a combination of both functions, si=
nce
> concurrent calls in other threads may interfere in a destructive way.
>=20
> Whole-program optimizations that could inline functions across librar=
y
> interfaces may expose unsafe reordering, and so performing inlining
> across the @glibcadj{} interface is not recommended.  The documented
> MT-Safety status is not guaranteed under whole-program optimization.
> However, functions defined in user-visible headers are designed to be
> safe for inlining.
>=20
> @item
> @cindex AS-Safe
> @cindex Async-Signal-Safe
> @code{AS-Safe} or Async-Signal-Safe functions are safe to call from
> asynchronous signal handlers.  AS, in AS-Safe, stands for Asynchronou=
s
> Signal.
>=20
> Many functions that are AS-Safe may set @code{errno}, or modify the
> floating-point environment, because their doing so does not make them
> unsuitable for use in signal handlers.  However, programs could
> misbehave should asynchronous signal handlers modify this thread-loca=
l
> state, and the signal handling machinery cannot be counted on to
> preserve it.  Therefore, signal handlers that call functions that may
> set @code{errno} or modify the floating-point environment @emph{must}
> save their original values, and restore them before returning.
>=20
> @item
> @cindex AC-Safe
> @cindex Async-Cancel-Safe
> @code{AC-Safe} or Async-Cancel-Safe functions are safe to call when
> asynchronous cancellation is enabled.  AC in AC-Safe stands for
> Asynchronous Cancellation.
>=20
> The POSIX standard defines only three functions to be AC-Safe, namely
> @code{pthread_cancel}, @code{pthread_setcancelstate}, and
> @code{pthread_setcanceltype}.  At present @theglibc{} provides no
> guarantees beyond these three functions, but does document which
> functions are presently AC-Safe.  This documentation is provided for =
use
> by @theglibc{} developers.
>=20
> Just like signal handlers, cancellation cleanup routines must configu=
re
> the floating point environment they require.  The routines cannot ass=
ume
> a floating point environment, particularly when asynchronous
> cancellation is enabled.  If the configuration of the floating point
> environment cannot be performed atomically then it is also possible t=
hat
> the environment encountered is internally inconsistent.
>=20
> @item
> @cindex MT-Unsafe
> @cindex Thread-Unsafe
> @cindex AS-Unsafe
> @cindex Async-Signal-Unsafe
> @cindex AC-Unsafe
> @cindex Async-Cancel-Unsafe
> @code{MT-Unsafe}, @code{AS-Unsafe}, @code{AC-Unsafe} functions are no=
t
> safe to call within the safety contexts described above.  Calling the=
m
> within such contexts invokes undefined behavior.
>=20
> Functions not explicitly documented as safe in a safety context shoul=
d
> be regarded as Unsafe.
>=20
> @item
> @cindex Preliminary
> @code{Preliminary} safety properties are documented, indicating these
> properties may @emph{not} be counted on in future releases of
> @theglibc{}.
>=20
> Such preliminary properties are the result of an assessment of the
> properties of our current implementation, rather than of what is
> mandated and permitted by current and future standards.
>=20
> Although we strive to abide by the standards, in some cases our
> implementation is safe even when the standard does not demand safety,
> and in other cases our implementation does not meet the standard safe=
ty
> requirements.  The latter are most likely bugs; the former, when mark=
ed
> as @code{Preliminary}, should not be counted on: future standards may
> require changes that are not compatible with the additional safety
> properties afforded by the current implementation.
>=20
> Furthermore, the POSIX standard does not offer a detailed definition =
of
> safety.  We assume that, by ``safe to call'', POSIX means that, as lo=
ng
> as the program does not invoke undefined behavior, the ``safe to call=
''
> function behaves as specified, and does not cause other functions to
> deviate from their specified behavior.  We have chosen to use its loo=
se
> definitions of safety, not because they are the best definitions to u=
se,
> but because choosing them harmonizes this manual with POSIX.
>=20
> Please keep in mind that these are preliminary definitions and
> annotations, and certain aspects of the definitions are still under
> discussion and might be subject to clarification or change.
>=20
> Over time, we envision evolving the preliminary safety notes into sta=
ble
> commitments, as stable as those of our interfaces.  As we do, we will
> remove the @code{Preliminary} keyword from safety notes.  As long as =
the
> keyword remains, however, they are not to be regarded as a promise of
> future behavior.
>=20
> @end itemize
>=20
> Other keywords that appear in safety notes are defined in subsequent
> sections.
>=20
> @node Unsafe Features, Conditionally Safe Features, POSIX Safety Conc=
epts, POSIX
> @subsubsection Unsafe Features
> @cindex Unsafe Features
>=20
> Functions that are unsafe to call in certain contexts are annotated w=
ith
> keywords that document their features that make them unsafe to call.
> AS-Unsafe features in this section indicate the functions are never s=
afe
> to call when asynchronous signals are enabled.  AC-Unsafe features
> indicate they are never safe to call when asynchronous cancellation i=
s
> enabled.  There are no MT-Unsafe marks in this section.
>=20
> @itemize @bullet
>=20
> @item @code{lock}
> @cindex lock
>=20
> Functions marked with @code{lock} as an AS-Unsafe feature may be
> interrupted by a signal while holding a non-recursive lock.  If the
> signal handler calls another such function that takes the same lock, =
the
> result is a deadlock.
>=20
> Functions annotated with @code{lock} as an AC-Unsafe feature may, if
> cancelled asynchronously, fail to release a lock that would have been
> released if their execution had not been interrupted by asynchronous
> thread cancellation.  Once a lock is left taken, attempts to take tha=
t
> lock will block indefinitely.
>=20
> @item @code{corrupt}
> @cindex corrupt
>=20
> Functions marked with @code{corrupt} as an AS-Unsafe feature may corr=
upt
> data structures and misbehave when they interrupt, or are interrupted
> by, another such function.  Unlike functions marked with @code{lock},
> these take recursive locks to avoid MT-Safety problems, but this is n=
ot
> enough to stop a signal handler from observing a partially-updated da=
ta
> structure.  Further corruption may arise from the interrupted functio=
n's
> failure to notice updates made by signal handlers.
>=20
> Functions marked with @code{corrupt} as an AC-Unsafe feature may leav=
e
> data structures in a corrupt, partially updated state.  Subsequent us=
es
> of the data structure may misbehave.
>=20
> @c A special case, probably not worth documenting separately, involve=
s
> @c reallocing, or even freeing pointers.  Any case involving free cou=
ld
> @c be easily turned into an ac-safe leak by resetting the pointer bef=
ore
> @c releasing it; I don't think we have any case that calls for this s=
ort
> @c of fixing.  Fixing the realloc cases would require a new interface=
:
> @c instead of @code{ptr=3Drealloc(ptr,size)} we'd have to introduce
> @c @code{acsafe_realloc(&ptr,size)} that would modify ptr before
> @c releasing the old memory.  The ac-unsafe realloc could be implemen=
ted
> @c in terms of an internal interface with this semantics (say
> @c __acsafe_realloc), but since realloc can be overridden, the functi=
on
> @c we call to implement realloc should not be this internal interface=
,
> @c but another internal interface that calls __acsafe_realloc if real=
loc
> @c was not overridden, and calls the overridden realloc with async
> @c cancel disabled.  --lxoliva
>=20
> @item @code{heap}
> @cindex heap
>=20
> Functions marked with @code{heap} may call heap memory management
> functions from the @code{malloc}/@code{free} family of functions and =
are
> only as safe as those functions.  This note is thus equivalent to:
>=20
> @sampsafety{@asunsafe{@asulock{}}@acunsafe{@aculock{} @acsfd{} @acsme=
m{}}}
>=20
> @c Check for cases that should have used plugin instead of or in
> @c addition to this.  Then, after rechecking gettext, adjust i18n if
> @c needed.
> @item @code{dlopen}
> @cindex dlopen
>=20
> Functions marked with @code{dlopen} use the dynamic loader to load
> shared libraries into the current execution image.  This involves
> opening files, mapping them into memory, allocating additional memory=
,
> resolving symbols, applying relocations and more, all of this while
> holding internal dynamic loader locks.
>=20
> The locks are enough for these functions to be AS- and AC-Unsafe, but
> other issues may arise.  At present this is a placeholder for all
> potential safety issues raised by @code{dlopen}.
>=20
> @c dlopen runs init and fini sections of the module; does this mean
> @c dlopen always implies plugin?
>=20
> @item @code{plugin}
> @cindex plugin
>=20
> Functions annotated with @code{plugin} may run code from plugins that
> may be external to @theglibc{}.  Such plugin functions are assumed to=
 be
> MT-Safe, AS-Unsafe and AC-Unsafe.  Examples of such plugins are stack
> @cindex NSS
> unwinding libraries, name service switch (NSS) and character set
> @cindex iconv
> conversion (iconv) back-ends.
>=20
> Although the plugins mentioned as examples are all brought in by mean=
s
> of dlopen, the @code{plugin} keyword does not imply any direct
> involvement of the dynamic loader or the @code{libdl} interfaces, tho=
se
> are covered by @code{dlopen}.  For example, if one function loads a
> module and finds the addresses of some of its functions, while anothe=
r
> just calls those already-resolved functions, the former will be marke=
d
> with @code{dlopen}, whereas the latter will get the @code{plugin}.  W=
hen
> a single function takes all of these actions, then it gets both marks=
=2E
>=20
> @item @code{i18n}
> @cindex i18n
>=20
> Functions marked with @code{i18n} may call internationalization
> functions of the @code{gettext} family and will be only as safe as th=
ose
> functions.  This note is thus equivalent to:
>=20
> @sampsafety{@mtsafe{@mtsenv{}}@asunsafe{@asucorrupt{} @ascuheap{} @as=
cudlopen{}}@acunsafe{@acucorrupt{}}}
>=20
> @item @code{timer}
> @cindex timer
>=20
> Functions marked with @code{timer} use the @code{alarm} function or
> similar to set a time-out for a system call or a long-running operati=
on.
> In a multi-threaded program, there is a risk that the time-out signal
> will be delivered to a different thread, thus failing to interrupt th=
e
> intended thread.  Besides being MT-Unsafe, such functions are always
> AS-Unsafe, because calling them in signal handlers may interfere with
> timers set in the interrupted code, and AC-Unsafe, because there is n=
o
> safe way to guarantee an earlier timer will be reset in case of
> asynchronous cancellation.
>=20
> @end itemize
>=20
> @node Conditionally Safe Features, Other Safety Remarks, Unsafe Featu=
res, POSIX
> @subsubsection Conditionally Safe Features
> @cindex Conditionally Safe Features
>=20
> For some features that make functions unsafe to call in certain
> contexts, there are known ways to avoid the safety problem other than
> refraining from calling the function altogether.  The keywords that
> follow refer to such features, and each of their definitions indicate
> how the whole program needs to be constrained in order to remove the
> safety problem indicated by the keyword.  Only when all the reasons t=
hat
> make a function unsafe are observed and addressed, by applying the
> documented constraints, does the function become safe to call in a
> context.
>=20
> @itemize @bullet
>=20
> @item @code{init}
> @cindex init
>=20
> Functions marked with @code{init} as an MT-Unsafe feature perform
> MT-Unsafe initialization when they are first called.
>=20
> Calling such a function at least once in single-threaded mode removes
> this specific cause for the function to be regarded as MT-Unsafe.  If=
 no
> other cause for that remains, the function can then be safely called
> after other threads are started.
>=20
> Functions marked with @code{init} as an AS- or AC-Unsafe feature use =
the
> internal @code{libc_once} machinery or similar to initialize internal
> data structures.
>=20
> If a signal handler interrupts such an initializer, and calls any
> function that also performs @code{libc_once} initialization, it will
> deadlock if the thread library has been loaded.
>=20
> Furthermore, if an initializer is partially complete before it is
> canceled or interrupted by a signal whose handler requires the same
> initialization, some or all of the initialization may be performed mo=
re
> than once, leaking resources or even resulting in corrupt internal da=
ta.
>=20
> Applications that need to call functions marked with @code{init} as a=
n
> AS- or AC-Unsafe feature should ensure the initialization is performe=
d
> before configuring signal handlers or enabling cancellation, so that =
the
> AS- and AC-Safety issues related with @code{libc_once} do not arise.
>=20
> @c We may have to extend the annotations to cover conditions in which
> @c initialization may or may not occur, since an initial call in a sa=
fe
> @c context is no use if the initialization doesn't take place at that
> @c time: it doesn't remove the risk for later calls.
>=20
> @item @code{race}
> @cindex race
>=20
> Functions annotated with @code{race} as an MT-Safety issue operate on
> objects in ways that may cause data races or similar forms of
> destructive interference out of concurrent execution.  In some cases,
> the objects are passed to the functions by users; in others, they are
> used by the functions to return values to users; in others, they are =
not
> even exposed to users.
>=20
> We consider access to objects passed as (indirect) arguments to
> functions to be data race free.  The assurance of data race free obje=
cts
> is the caller's responsibility.  We will not mark a function as
> MT-Unsafe or AS-Unsafe if it misbehaves when users fail to take the
> measures required by POSIX to avoid data races when dealing with such
> objects.  As a general rule, if a function is documented as reading f=
rom
> an object passed (by reference) to it, or modifying it, users ought t=
o
> use memory synchronization primitives to avoid data races just as the=
y
> would should they perform the accesses themselves rather than by call=
ing
> the library function.  @code{FILE} streams are the exception to the
> general rule, in that POSIX mandates the library to guard against dat=
a
> races in many functions that manipulate objects of this specific opaq=
ue
> type.  We regard this as a convenience provided to users, rather than=
 as
> a general requirement whose expectations should extend to other types=
=2E
>=20
> In order to remind users that guarding certain arguments is their
> responsibility, we will annotate functions that take objects of certa=
in
> types as arguments.  We draw the line for objects passed by users as
> follows: objects whose types are exposed to users, and that users are
> expected to access directly, such as memory buffers, strings, and
> various user-visible @code{struct} types, do @emph{not} give reason f=
or
> functions to be annotated with @code{race}.  It would be noisy and
> redundant with the general requirement, and not many would be surpris=
ed
> by the library's lack of internal guards when accessing objects that =
can
> be accessed directly by users.
>=20
> As for objects that are opaque or opaque-like, in that they are to be
> manipulated only by passing them to library functions (e.g.,
> @code{FILE}, @code{DIR}, @code{obstack}, @code{iconv_t}), there might=
 be
> additional expectations as to internal coordination of access by the
> library.  We will annotate, with @code{race} followed by a colon and =
the
> argument name, functions that take such objects but that do not take
> care of synchronizing access to them by default.  For example,
> @code{FILE} stream @code{unlocked} functions will be annotated, but
> those that perform implicit locking on @code{FILE} streams by default
> will not, even though the implicit locking may be disabled on a
> per-stream basis.
>=20
> In either case, we will not regard as MT-Unsafe functions that may
> access user-supplied objects in unsafe ways should users fail to ensu=
re
> the accesses are well defined.  The notion prevails that users are
> expected to safeguard against data races any user-supplied objects th=
at
> the library accesses on their behalf.
>=20
> @c The above describes @mtsrace; @mtasurace is described below.
>=20
> This user responsibility does not apply, however, to objects controll=
ed
> by the library itself, such as internal objects and static buffers us=
ed
> to return values from certain calls.  When the library doesn't guard
> them against concurrent uses, these cases are regarded as MT-Unsafe a=
nd
> AS-Unsafe (although the @code{race} mark under AS-Unsafe will be omit=
ted
> as redundant with the one under MT-Unsafe).  As in the case of
> user-exposed objects, the mark may be followed by a colon and an
> identifier.  The identifier groups all functions that operate on a
> certain unguarded object; users may avoid the MT-Safety issues relate=
d
> with unguarded concurrent access to such internal objects by creating=
 a
> non-recursive mutex related with the identifier, and always holding t=
he
> mutex when calling any function marked as racy on that identifier, as
> they would have to should the identifier be an object under user
> control.  The non-recursive mutex avoids the MT-Safety issue, but it
> trades one AS-Safety issue for another, so use in asynchronous signal=
s
> remains undefined.
>=20
> When the identifier relates to a static buffer used to hold return
> values, the mutex must be held for as long as the buffer remains in u=
se
> by the caller.  Many functions that return pointers to static buffers
> offer reentrant variants that store return values in caller-supplied
> buffers instead.  In some cases, such as @code{tmpname}, the variant =
is
> chosen not by calling an alternate entry point, but by passing a
> non-@code{NULL} pointer to the buffer in which the returned values ar=
e
> to be stored.  These variants are generally preferable in multi-threa=
ded
> programs, although some of them are not MT-Safe because of other
> internal buffers, also documented with @code{race} notes.
>=20
> @item @code{const}
> @cindex const
>=20
> Functions marked with @code{const} as an MT-Safety issue non-atomical=
ly
> modify internal objects that are better regarded as constant, because=
 a
> substantial portion of @theglibc{} accesses them without
> synchronization.  Unlike @code{race}, that causes both readers and
> writers of internal objects to be regarded as MT-Unsafe and AS-Unsafe=
,
> this mark is applied to writers only.  Writers remain equally MT- and
> AS-Unsafe to call, but the then-mandatory constness of objects they
> modify enables readers to be regarded as MT-Safe and AS-Safe (as long=
 as
> no other reasons for them to be unsafe remain), since the lack of
> synchronization is not a problem when the objects are effectively
> constant.
>=20
> The identifier that follows the @code{const} mark will appear by itse=
lf
> as a safety note in readers.  Programs that wish to work around this
> safety issue, so as to call writers, may use a non-recursve
> @code{rwlock} associated with the identifier, and guard @emph{all} ca=
lls
> to functions marked with @code{const} followed by the identifier with=
 a
> write lock, and @emph{all} calls to functions marked with the identif=
ier
> by itself with a read lock.  The non-recursive locking removes the
> MT-Safety problem, but it trades one AS-Safety problem for another, s=
o
> use in asynchronous signals remains undefined.
>=20
> @c But what if, instead of marking modifiers with const:id and reader=
s
> @c with just id, we marked writers with race:id and readers with ro:i=
d?
> @c Instead of having to define each instance of =93id=94, we'd have a
> @c general pattern governing all such =93id=94s, wherein race:id woul=
d
> @c suggest the need for an exclusive/write lock to make the function
> @c safe, whereas ro:id would indicate =93id=94 is expected to be read=
-only,
> @c but if any modifiers are called (while holding an exclusive lock),
> @c then ro:id-marked functions ought to be guarded with a read lock f=
or
> @c safe operation.  ro:env or ro:locale, for example, seems to convey
> @c more clearly the expectations and the meaning, than just env or
> @c locale.
>=20
> @item @code{sig}
> @cindex sig
>=20
> Functions marked with @code{sig} as a MT-Safety issue (that implies a=
n
> identical AS-Safety issue, omitted for brevity) may temporarily insta=
ll
> a signal handler for internal purposes, which may interfere with othe=
r
> uses of the signal, identified after a colon.
>=20
> This safety problem can be worked around by ensuring that no other us=
es
> of the signal will take place for the duration of the call.  Holding =
a
> non-recursive mutex while calling all functions that use the same
> temporary signal; blocking that signal before the call and resetting =
its
> handler afterwards is recommended.
>=20
> There is no safe way to guarantee the original signal handler is
> restored in case of asynchronous cancellation, therefore so-marked
> functions are also AC-Unsafe.
>=20
> @c fixme: at least deferred cancellation should get it right, and wou=
ld
> @c obviate the restoring bit below, and the qualifier above.
>=20
> Besides the measures recommended to work around the MT- and AS-Safety
> problem, in order to avert the cancellation problem, disabling
> asynchronous cancellation @emph{and} installing a cleanup handler to
> restore the signal to the desired state and to release the mutex are
> recommended.
>=20
> @item @code{term}
> @cindex term
>=20
> Functions marked with @code{term} as an MT-Safety issue may change th=
e
> terminal settings in the recommended way, namely: call @code{tcgetatt=
r},
> modify some flags, and then call @code{tcsetattr}; this creates a win=
dow
> in which changes made by other threads are lost.  Thus, functions mar=
ked
> with @code{term} are MT-Unsafe.  The same window enables changes made=
 by
> asynchronous signals to be lost.  These functions are also AS-Unsafe,
> but the corresponding mark is omitted as redundant.
>=20
> It is thus advisable for applications using the terminal to avoid
> concurrent and reentrant interactions with it, by not using it in sig=
nal
> handlers or blocking signals that might use it, and holding a lock wh=
ile
> calling these functions and interacting with the terminal.  This lock
> should also be used for mutual exclusion with functions marked with
> @code{@mtasurace{:tcattr(fd)}}, where @var{fd} is a file descriptor f=
or
> the controlling terminal.  The caller may use a single mutex for
> simplicity, or use one mutex per terminal, even if referenced by
> different file descriptors.
>=20
> Functions marked with @code{term} as an AC-Safety issue are supposed =
to
> restore terminal settings to their original state, after temporarily
> changing them, but they may fail to do so if cancelled.
>=20
> @c fixme: at least deferred cancellation should get it right, and wou=
ld
> @c obviate the restoring bit below, and the qualifier above.
>=20
> Besides the measures recommended to work around the MT- and AS-Safety
> problem, in order to avert the cancellation problem, disabling
> asynchronous cancellation @emph{and} installing a cleanup handler to
> restore the terminal settings to the original state and to release th=
e
> mutex are recommended.
>=20
> @end itemize
>=20
> @node Other Safety Remarks, , Conditionally Safe Features, POSIX
> @subsubsection Other Safety Remarks
> @cindex Other Safety Remarks
>=20
> Additional keywords may be attached to functions, indicating features
> that do not make a function unsafe to call, but that may need to be
> taken into account in certain classes of programs:
>=20
> @itemize @bullet
>=20
> @item @code{locale}
> @cindex locale
>=20
> Functions annotated with @code{locale} as an MT-Safety issue read fro=
m
> the locale object without any form of synchronization.  Functions
> annotated with @code{locale} called concurrently with locale changes =
may
> behave in ways that do not correspond to any of the locales active
> during their execution, but an unpredictable mix thereof.
>=20
> We do not mark these functions as MT- or AS-Unsafe, however, because
> functions that modify the locale object are marked with
> @code{const:locale} and regarded as unsafe.  Being unsafe, the latter
> are not to be called when multiple threads are running or asynchronou=
s
> signals are enabled, and so the locale can be considered effectively
> constant in these contexts, which makes the former safe.
>=20
> @c Should the locking strategy suggested under @code{const} be used,
> @c failure to guard locale uses is not as fatal as data races in
> @c general: unguarded uses will @emph{not} follow dangling pointers o=
r
> @c access uninitialized, unmapped or recycled memory.  Each access wi=
ll
> @c read from a consistent locale object that is or was active at some
> @c point during its execution.  Without synchronization, however, it
> @c cannot even be assumed that, after a change in locale, earlier
> @c locales will no longer be used, even after the newly-chosen one is
> @c used in the thread.  Nevertheless, even though unguarded reads fro=
m
> @c the locale will not violate type safety, functions that access the
> @c locale multiple times may invoke all sorts of undefined behavior
> @c because of the unexpected locale changes.
>=20
> @item @code{env}
> @cindex env
>=20
> Functions marked with @code{env} as an MT-Safety issue access the
> environment with @code{getenv} or similar, without any guards to ensu=
re
> safety in the presence of concurrent modifications.
>=20
> We do not mark these functions as MT- or AS-Unsafe, however, because
> functions that modify the environment are all marked with
> @code{const:env} and regarded as unsafe.  Being unsafe, the latter ar=
e
> not to be called when multiple threads are running or asynchronous
> signals are enabled, and so the environment can be considered
> effectively constant in these contexts, which makes the former safe.
>=20
> @item @code{hostid}
> @cindex hostid
>=20
> The function marked with @code{hostid} as an MT-Safety issue reads fr=
om
> the system-wide data structures that hold the ``host ID'' of the
> machine.  These data structures cannot generally be modified atomical=
ly.
> Since it is expected that the ``host ID'' will not normally change, t=
he
> function that reads from it (@code{gethostid}) is regarded as safe,
> whereas the function that modifies it (@code{sethostid}) is marked wi=
th
> @code{@mtasuconst{:@mtshostid{}}}, indicating it may require special
> care if it is to be called.  In this specific case, the special care
> amounts to system-wide (not merely intra-process) coordination.
>=20
> @item @code{sigintr}
> @cindex sigintr
>=20
> Functions marked with @code{sigintr} as an MT-Safety issue access the
> @code{_sigintr} internal data structure without any guards to ensure
> safety in the presence of concurrent modifications.
>=20
> We do not mark these functions as MT- or AS-Unsafe, however, because
> functions that modify the this data structure are all marked with
> @code{const:sigintr} and regarded as unsafe.  Being unsafe, the latte=
r
> are not to be called when multiple threads are running or asynchronou=
s
> signals are enabled, and so the data structure can be considered
> effectively constant in these contexts, which makes the former safe.
>=20
> @item @code{fd}
> @cindex fd
>=20
> Functions annotated with @code{fd} as an AC-Safety issue may leak fil=
e
> descriptors if asynchronous thread cancellation interrupts their
> execution.
>=20
> Functions that allocate or deallocate file descriptors will generally=
 be
> marked as such.  Even if they attempted to protect the file descripto=
r
> allocation and deallocation with cleanup regions, allocating a new
> descriptor and storing its number where the cleanup region could rele=
ase
> it cannot be performed as a single atomic operation.  Similarly,
> releasing the descriptor and taking it out of the data structure
> normally responsible for releasing it cannot be performed atomically.
> There will always be a window in which the descriptor cannot be relea=
sed
> because it was not stored in the cleanup handler argument yet, or it =
was
> already taken out before releasing it.  It cannot be taken out after
> release: an open descriptor could mean either that the descriptor sti=
ll
> has to be closed, or that it already did so but the descriptor was
> reallocated by another thread or signal handler.
>=20
> Such leaks could be internally avoided, with some performance penalty=
,
> by temporarily disabling asynchronous thread cancellation.  However,
> since callers of allocation or deallocation functions would have to d=
o
> this themselves, to avoid the same sort of leak in their own layer, i=
t
> makes more sense for the library to assume they are taking care of it
> than to impose a performance penalty that is redundant when the probl=
em
> is solved in upper layers, and insufficient when it is not.
>=20
> This remark by itself does not cause a function to be regarded as
> AC-Unsafe.  However, cumulative effects of such leaks may pose a
> problem for some programs.  If this is the case, suspending asynchron=
ous
> cancellation for the duration of calls to such functions is recommend=
ed.
>=20
> @item @code{mem}
> @cindex mem
>=20
> Functions annotated with @code{mem} as an AC-Safety issue may leak
> memory if asynchronous thread cancellation interrupts their execution=
=2E
>=20
> The problem is similar to that of file descriptors: there is no atomi=
c
> interface to allocate memory and store its address in the argument to=
 a
> cleanup handler, or to release it and remove its address from that
> argument, without at least temporarily disabling asynchronous
> cancellation, which these functions do not do.
>=20
> This remark does not by itself cause a function to be regarded as
> generally AC-Unsafe.  However, cumulative effects of such leaks may b=
e
> severe enough for some programs that disabling asynchronous cancellat=
ion
> for the duration of calls to such functions may be required.
>=20
> @item @code{cwd}
> @cindex cwd
>=20
> Functions marked with @code{cwd} as an MT-Safety issue may temporaril=
y
> change the current working directory during their execution, which ma=
y
> cause relative pathnames to be resolved in unexpected ways in other
> threads or within asynchronous signal or cancellation handlers.
>=20
> This is not enough of a reason to mark so-marked functions as MT- or
> AS-Unsafe, but when this behavior is optional (e.g., @code{nftw} with
> @code{FTW_CHDIR}), avoiding the option may be a good alternative to
> using full pathnames or file descriptor-relative (e.g. @code{openat})
> system calls.
>=20
> @item @code{!posix}
> @cindex !posix
>=20
> This remark, as an MT-, AS- or AC-Safety note to a function, indicate=
s
> the safety status of the function is known to differ from the specifi=
ed
> status in the POSIX standard.  For example, POSIX does not require a
> function to be Safe, but our implementation is, or vice-versa.
>=20
> For the time being, the absence of this remark does not imply the saf=
ety
> properties we documented are identical to those mandated by POSIX for
> the corresponding functions.
>=20
> @item @code{:identifier}
> @cindex :identifier
>=20
> Annotations may sometimes be followed by identifiers, intended to gro=
up
> several functions that e.g. access the data structures in an unsafe w=
ay,
> as in @code{race} and @code{const}, or to provide more specific
> information, such as naming a signal in a function marked with
> @code{sig}.  It is envisioned that it may be applied to @code{lock} a=
nd
> @code{corrupt} as well in the future.
>=20
> In most cases, the identifier will name a set of functions, but it ma=
y
> name global objects or function arguments, or identifiable properties=
 or
> logical components associated with them, with a notation such as
> e.g. @code{:buf(arg)} to denote a buffer associated with the argument
> @var{arg}, or @code{:tcattr(fd)} to denote the terminal attributes of=
 a
> file descriptor @var{fd}.
>=20
> The most common use for identifiers is to provide logical groups of
> functions and arguments that need to be protected by the same
> synchronization primitive in order to ensure safe operation in a give=
n
> context.
>=20
> @item @code{/condition}
> @cindex /condition
>=20
> Some safety annotations may be conditional, in that they only apply i=
f a
> boolean expression involving arguments, global variables or even the
> underlying kernel evaluates evaluates to true.  Such conditions as
> @code{/hurd} or @code{/!linux!bsd} indicate the preceding marker only
> applies when the underlying kernel is the HURD, or when it is neither
> Linux nor a BSD kernel, respectively.  @code{/!ps} and
> @code{/one_per_line} indicate the preceding marker only applies when
> argument @var{ps} is NULL, or global variable @var{one_per_line} is
> nonzero.
>=20
> When all marks that render a function unsafe are adorned with such
> conditions, and none of the named conditions hold, then the function =
can
> be regarded as safe.
>=20
> @end itemize
> ---
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
