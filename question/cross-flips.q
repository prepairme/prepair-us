{
    "details": "<p><var>N</var><img alt=\"\u00d7\" border=\"0\" height=\"9\" src=\"images/symbol_times.gif\" style=\"vertical-align:middle;\" width=\"9\"/><var>N</var> disks are placed on a square game board. Each disk has a black side and white side.</p><p>At each turn, you may choose a disk and flip all the disks in the same row and the same column as this disk: thus 2<img alt=\"\u00d7\" border=\"0\" height=\"9\" src=\"images/symbol_times.gif\" style=\"vertical-align:middle;\" width=\"9\"/><var>N</var>-1 disks are flipped. The game ends when all disks show their white side. The following example shows a game on a 5<img alt=\"\u00d7\" border=\"0\" height=\"9\" src=\"images/symbol_times.gif\" style=\"vertical-align:middle;\" width=\"9\"/>5 board.</p><div align=\"center\"><img src=\"project/images/p_331_crossflips3.gif\"/></div><p>It can be proven that 3 is the minimal number of turns to finish this game.</p><p>The bottom left disk on the <var>N</var><img alt=\"\u00d7\" border=\"0\" height=\"9\" src=\"images/symbol_times.gif\" style=\"vertical-align:middle;\" width=\"9\"/><var>N</var> board has coordinates (0,0);<br/>the bottom right disk has coordinates (<var>N</var>-1,0) and the top left disk has coordinates (0,<var>N</var>-1). </p><p>Let C<sub><var>N</var></sub> be the following configuration of a board with <var>N</var><img alt=\"\u00d7\" border=\"0\" height=\"9\" src=\"images/symbol_times.gif\" style=\"vertical-align:middle;\" width=\"9\"/><var>N</var> disks:<br/>A disk at (<var>x</var>,<var>y</var>) satisfying <img src=\"project/images/p_331_crossflips1.gif\" style=\"vertical-align:middle\"/>, shows its black side; otherwise, it shows its white side. C<sub>5</sub> is shown above.</p><p>Let T(<var>N</var>) be the minimal number of turns to finish a game starting from configuration C<sub><var>N</var></sub> or 0 if configuration C<sub><var>N</var></sub> is unsolvable.<br/>We have shown that T(5)=3. You are also given that T(10)=29 and T(1 000)=395253.</p><p>Find <img src=\"project/images/p_331_crossflips2.gif\" style=\"vertical-align:middle\"/>.</p>",
    "folder": "cross-flips",
    "level": 1,
    "random": 0.5732171110156067,
    "tags": [],
    "title": "Cross flips"
}